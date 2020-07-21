# HackerRank Template in Elixir
### May 27, 2019

A colleague of mine sent me a link to a hacker rank challenge
called [Two Character](https://www.hackerrank.com/challenges/two-characters/problem)

While giving it a try, I noticed no [Elixir](https://elixir-lang.org/) solution (yet!).
Here's what the template solution looks like

```elixir
defmodule Solution do
#Enter your code here. Read input from STDIN. Print output to STDOUT
end
```

Here is how I am structuring my answer.

```elixir
defmodule Solution do
  def go() do
    num = input(:int)
    text = input(:string)
    IO.puts("INPUTS #{num} and #{text}")
  end

  def input(:string), do: IO.read(:line) |> String.trim()
  def input(:int), do: input(:string) |> String.to_integer()
end

# Now run your code
Solution.go()
```

When you run against HackerRank, you (properly get)

![Reading and Writing for HackerRank](/anunknown/assets/static/images/hackerrank-elixir/elixir_solution_setup.png?raw=true)

Notice the OUTPUT properly captured the input (i.e. the code is
working as expected, but not yet as desired).

Now go forth and HackerRank!!!
