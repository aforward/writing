# Continuous Testing with Elixir
#meta datetime 2015-12-02
#meta tags[] elixir testing

## Summary

There is great power in having your tests always run, all the time when writing code, it stops the minor interruptions.

```bash
$ mix test.watch

Running tests...
..................................................
..................................................
....
Finished in 0.04 seconds (0.04s on load, 0.00s on tests)
104 tests, 0 failures
Randomized with seed 386800
```

## Article

There is great power in having your tests always run, all the time when writing code, it stops the minor interruptions.

First, let's start a new Elixir app. If you are new to elixir then first check out the many resources to get started. I also published a very small example on GitHub, if you prefer to look at code than read articles.

```elixir
$ mix new my_app
```

Then add a dependency to mix_test_watch in your mix.exs.

If you are running Elixir 1.4 (or later)

```elixir
defp deps do
  [{:mix_test_watch, "~> 0.3", only: :dev, runtime: false}]
end
```

Or, for Elixir 1.3 (or earlier)

```elixir
defp deps do
  [{:mix_test_watch, "~> 0.3", only: :dev}]
end
```

Grab all dependencies

```bash
$ mix deps.get
```

You might want to clear your terminal on each test run, you can do this my adding the following line to the ./config/config.exs file.

```elixir
if Mix.env == :dev do
  config :mix_test_watch,
    clear: true
end
```

If you are within a Phoenix application, you might encounter the following dependency issue:

```bash
Failed to use "fs" (versions 0.9.1 and 0.9.2) because
    mix_test_watch (versions 0.3.0 to 0.3.3) requires ~> 2.12
    phoenix_live_reload (version 1.0.8) requires ~> 0.9.1
```

Then forcibly update your phoenix_live_reload with

```bash
mix do deps.update phoenix_live_reload deps.get
```

And now launch your watcher

```bash
$ mix test.watch
```

If you see the following error

```bash
[error] backend port not found: :inotifywait
```

Then you need to install inotify, which on Ubuntu can be installed using

```bash
sudo apt-get install inotify-tools
```

Now you can try again,

```bash
$ mix test.watch
```

Your project will now automatically compile and re-run all tests on save. The output should look similar to the following

```bash
==> fs (compile)
Compiled src/fs_event_bridge.erl
Compiled src/fs_server.erl
Compiled src/sys/fsevents.erl
Compiled src/sys/inotifywait_win32.erl
Compiled src/fs_sup.erl
Compiled src/fs_app.erl
Compiled src/sys/inotifywait.erl
Compiled src/fs.erl
==> mix_test_watch
Compiled lib/mix_test_watch/paths.ex
Compiled lib/mix/tasks/test/watch.ex
Generated mix_test_watch app
Running tests...
Setting up watches. Beware: since -r was given, this may take a while!
Watches established.
==> fs (compile)
==> mix_test_watch
Compiled lib/mix_test_watch/paths.ex
Compiled lib/mix/tasks/test/watch.ex
Generated mix_test_watch app
==> my_app
Compiled lib/my_app.ex
Generated my_app app
.
Finished in 0.05 seconds (0.05s on load, 0.00s on tests)
1 test, 0 failures
Randomized with seed 474092
```

Now let's add a new test. Open up your new project in your favourite elixir editor and add a new test. For example, let's see if two wrongs make a right (vi ./test/my_app_test.exs).

```elixir
defmodule MyAppTest do
  use ExUnit.Case
  doctest MyApp
  test “the truth” do
    assert 1 + 1 == 2
  end
  test “checking what two wrongs make” do
    assert (false && false) == true
  end
end
```

If we now look at our terminal, we should see the failure

```bash
Running tests...
1) test another truth (MyAppTest)
 test/my_app_test.exs:9
 Assertion with == failed
 code: (false && false) == true
 lhs: false
 rhs: true
 stacktrace:
 test/my_app_test.exs:10
.
Finished in 0.07 seconds (0.07s on load, 0.00s on tests)
2 tests, 1 failure
Randomized with seed 807654
```

Turns out two wrongs don't make a right. Let's update the test.

```elixir
defmodule MyAppTest do
  use ExUnit.Case
  doctest MyApp
  test “the truth” do
    assert 1 + 1 == 2
  end
  test “checking what two wrongs make” do
    assert (false && false) == false
  end
end
```

And now we are back to 100% test passing (all without having to leave our editor).

```bash
Running tests...
..
Finished in 0.04 seconds (0.04s on load, 0.00s on tests)
2 tests, 0 failures
Randomized with seed 386800
```

When running tests that require a database, you might run into an issue where your test database is not properly created before the tests are run.

```
[error] Postgrex.Protocol (#PID<0.221.0>) failed to connect:
** (Postgrex.Error) FATAL 3D000 (invalid_catalog_name):
database "myapp_test" does not exist
```

The suggested approach is to create an alias in your mix.exs file, like

```elixir
def aliases() do
    ["test": ["ecto.drop --quiet", "ecto.create --quiet",
              "ecto.migrate", "test"]]
end
```

Unfortunately, for test.watch you will probably observe the following error

```bash
** (Mix) The database for MyApp.Repo couldn't be dropped:
ERROR 55006 (object_in_use): database "myapp_test"
is being accessed by other users

There are 99 other sessions using the database.
```

To get around this, consider changing your alias to

```elixir
def aliases() do
    ["test.once": ["ecto.drop --quiet",
                   "ecto.create --quiet",
                   "ecto.migrate", "test"]]
end
```

You will still need to run mix test.once every time your database schema changes, but hopefully that is not too often.

If you prefer living dangerously, then consider using a fork of the project with additional features to help avoid those issues above.

```elixir
if Mix.env == :dev do
  config :mix_test_watch,
    ansi_enabled: :ignore,
    clear: true
end
```

With the above your test alias (the one that you might have changed to test.once will now work every time.

If you would prefer to just run the database setup when you first start mix test.watch then leave thetest.once alias alone, and instead configure :mix_test_watch with a :setup_tasksas follows (which will only be run once upon start up.

```elixir
if Mix.env == :dev do
  config :mix_test_watch,
    setup_tasks: [
      "ecto.drop --quiet",
      "ecto.create --quiet",
      "ecto.migrate",
    ],
    ansi_enabled: :ignore,
    clear: true
end
```

There are two pull requests against the the original project [PR#70 and PR#71], so check to see if they have been merged and available in the official release.

To learn more about the practice of continuous, consider picking up this great (albeit now out of print) book Continuous Testing with Ruby, Rails and Javascript

![Continuous Testing with Ruby](books/continuous_testing_ruby.jpg)