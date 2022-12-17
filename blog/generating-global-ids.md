# Generating Globally Unique IDs
#meta datetime 2020-05-26
#meta tags[] elixir


## Summary

Imagine you are building a system to assign unique numbers to each
resource that you manage. You want the IDs to be guaranteed unique
i.e. no UUIDs.  Since these ids are globally unique, each id can
only be given out at most once.

Here is a summary of my solution.


```elixir
def handle_call(:get_id, _from, %{node_id: node_id, counter: counter} = state) do
  <<id::size(64)>> = <<node_id::10, timestamp()::47, counter::7>>
  {:reply, id, %{state | counter: counter + 1}}
end
```

## Article

### Problem

Imagine you are building a system to assign unique numbers to each
resource that you manage. You want the IDs to be guaranteed unique
i.e. no UUIDs.  Since these ids are globally unique, each id can
only be given out at most once.

The ids are 64 bits long.

There are a fixed number of nodes in the system, up to 1024.

Each node knows its ID at startup and that ID never changes
for the node.

### Solution

You can [visit the source on GitHub](https://github.com/work-samples/global_id)

#### Unsynchronized ID Generation

We are splitting the ID generation between several nodes.
To build a guaranteed-globally-unique generator without
any synchronization between each node, we can split our IDs
between

* X bits to identify the node
* Y bits of unique numbers within a node.

Knowing that we will have at most 1024 (2^10) nodes, we
can reserve the first 10 bits of our number to uniquely
identify the node.

```
XXXXXXXXXX YYYYY.........YYYYY
  10 bits        54 bits
```

#### By-Hand Demonstration

Let's demonstrate with an example.  But, we will use
smaller numbers to better visualize the solution.  Let's
make a 5-bit counter split between up to 4 nodes.

In this example, we need 2 bits to identify the nodes, leaving
3 bits for each node to count with.

```
XX YYY
```

So each node's numbers would be split between

```
N0: 00 YYY
N1: 01 YYY
N2: 10 YYY
N3: 11 YYY
```

Now each node is responsible for managing its own uniqueness
of a 3-bit number.  Global uniqueness will be assured by
our NodeId prefix (the first two bits).


#### Elixir Demonstration

This can be represented using
[Bitstrings](https://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html#bitstrings)
in Elixir.

Here's the number 9 represented in bits

```
01001
 ^  ^
 8  1
```

Let's look at our 5-bit example in the iex shell.

In Elixir, this can be (in a slightly verbose manner) done as follows

```elixir
<<0::1,1::1,0::1,0::1,1::1>>
```

For our example nodes, this can be split between 2 bits for
the node and 3 bits for the number

```elixir
<<1::2,1::3>>
```

To extract the `integer` we can use Elixir pattern matching

```elixir
<<n::5>> = <<1::2,1::3>>
```

#### Elixir Template Solution

We now have enough to build a template solution for our GlobalId.

```elixir
@doc """
Return a globally unique 64-bit non-negative integer.

Each node can be represented with 10 bits (2^10 = 1024)
we will use our unique node prefix, and then the
remaining 54 bits to be unique within the node.

The underlying call to timestamp is not guaranteed to be
monotonic, and we do not support two calls within the
same microsoft, but this is a good start.
"""
@spec get_id() :: non_neg_integer
def get_id() do
  <<n::size(64)>> = <<node_id()::10,next_id()::54>>
  n
end
```

The `node_id()` is assigned automatically from the node itself.
The specification for the `next_id()` only needs to be
unique within the node itself.

```elixir
@doc """
Return a locally unique non-negative integer.
"""
@spec next_id() :: non_neg_integer
def next_id
```

Before we implement the `next_id()`, let's analyze how
many numbers can be generated so we can evaluate
the appropriateness of our solution.


#### How Many Unique Numbers are Possible

Our system can, at most, distribute up to a million-trillion
unique IDs (2^64 = 64-bit number).

```
18,446,744,073,709,552,000 (2^64)
mT  kT   T   B   M   k
```

We are splitting our generator between (up to) 1024 nodes
so each node can, at most, distribute up to a thousand-trillion
unique IDs (2^54)

```
18,014,398,509,481,984
kT   T   B   M
```

#### Timestamp solution

A timestamp-based solution is simple but offers two possible
problems.

First, when will the numbers run out?  And second,
will there ever be two requests at the exact _same time_
(based on the precision of our timestamp)
causing our solution to (incorrectly) return duplicate IDs.

##### How long will 2^54 last?

Today's date (approx) is 1.5 billion milliseconds

```
1,590,159,116
B   M
```

Even if we supported units in microseconds, that
is still only about 1.5 trillion microseconds per year,
leaving each node with 18,013 trillion numbers possible values instead of
18,014 trillion.

There are about 30 billion milliseconds each year
(365\*24\*60\*60\*1000), so we have until the year 600k
until we exhaust 2^54 numbers based on a timestamp.

##### Two Requests At the Same Time?

This is a bigger concern for uniqueness.

If our timestamp can only resolve to milliseconds,
and we expect about 100k requests per second, that is
around 100 requests every millisecond, which is not precise enough.

If we had micro-time resolution, **and** if we could guarantee
that our `get_id()` would perform not faster than a `1μ ms`
then our solution below would be sufficient for our needs.

```elixir
@doc """
Return a locally unique non-negative integer.
"""
@spec next_id() :: non_neg_integer
def next_id, do: :os.system_time(:microsecond)
```

If we cannot guarantee those conditions then we need to
look at `GlobalId` maintaining its counter.

#### How much to count?

Our system could receive 100,000 requests a second.
But we don't know the distribution within the second.
Maybe they all arrive at once, or maybe they are
evenly distributed about 100 every millisecond.

###### Counting 100k every second

If we have no guarantees about how the requests are
distributed within a second, then we need 17 bits to
track those 100k per second requests (2^17=131k)

Let us revisit our 64-bit number, where we have

* 10 X bits for the node,
* 37 Y bits for the timestamp, and
* 17 Z bits for the counter.

```
XXXXXXXXXX YYYYY.........YYYYY  ZZZZZ.........ZZZZ
  10 bits        37 bits              17 bits
```

We now have fewer bits for our timestamp, so let us
see if we can still reasonably generate numbers for a long time.

At millisecond precision, 37 bits only supports 137 billion
numbers or 5 years.

```
137,438,953,472
  B   M
```

Clearly not enough.

##### To-The-Second Precision

We could consider to-the-second precision for our timestamp
as we would be managing sub-second counting, this would give
us around 4.5k years of unique numbers.

##### Counting 100 every millisecond

We could also see if our messages would be evenly distributed
throughout every millisecond, which would require only 7 bits
to track our counter as at most 100 requests would arrive
every millisecond (2^7=128).

Our new scheme for the 64-bit number, would be

* 10 X bits for the node,
* 47 Y bits for the timestamp, and
* 7 Z bits for the counter.

```
XXXXXXXXXX YYYYY.........YYYYY  ZZZZZ.........ZZZZ
  10 bits        47 bits              7 bits
```

At 47 bits, our timestamp supports up to 140 trillion numbers,
at at 30 billion milliseconds per year, our system would last
about 4.5k years of generating unique numbers.

```
140,737,488,355,328
  T   B   M
```

If we wanted to count to 1000 (instead of a 100), then we could
support up to 1000 bursts every millisecond (instead of the
uniformly 10/ms) then our system would last for about 500 years.

```
17,592,186,044,416
 T    B   M
```

##### Why keep the timestamp?

You could argue if your system can count to a thousand, or
to one-hundred thousand, why not have it do all the counting?

The reason: down-time and failures.

If a node goes offline, then when we bring it back up, or
if a new node is brought back up in its stead, we do not
need to manage any external state and the counter will continue
to generate globally unique numbers.  This works nicely with
Elixir/Erlang as our `GlobalId` could be part of a supervision tree
that could automatically re-start it on failure.

#### Counting in Elixir

Elixir (and Erlang) offer several mechanisms to
support internal state.  The most commonly used is a GenServer
(which stands for a Generic Server) which we will use below.

We will configure our GenServer with

```elixir
defmodule GlobalId do
  use GenServer

  @impl true
  def init(_) do
    {:ok, %{counter: 0}}
  end

end
```

And our counter will increment the state on each request.

```elixir
  @impl true
  def handle_call(:next_id, _from, %{counter: counter}) do
    {:reply, counter, %{counter: counter + 1}}
  end
```

We will update our `get_id()` and `next_id()` implementations
to use this counter.

```elixir
  @spec get_id(pid()) :: non_neg_integer
  def get_id(pid) do
    <<n::size(64)>> = <<node_id()::10, timestamp()::47, next_id(pid)::7>>
    n
  end

  @spec next_id(pid()) :: non_neg_integer
  def next_id(pid), do: GenServer.call(pid, :next_id)
```

##### Full Solution

Our full solution using the GenServer is shown below.


```elixir
defmodule GlobalId do
  use GenServer

  @moduledoc """
  GlobalId module contains an implementation of a guaranteed globally unique id system.
  """

  @doc """
  Return a globally unique 64-bit non-negative integer.

  Each node can be represented with 10 bits (2^10 = 1024)
  we will use the unique node prefix, and then the
  remaining 54 bits to be unique within the node.

  The underlying call to timestamp is not guaranteed to be
  monotonic, and we do not support two calls within the
  same microsecond, but this is a good start.
  """
  @spec get_id(pid()) :: non_neg_integer
  def get_id(pid) do
    <<n::size(64)>> = <<node_id()::10, timestamp()::47, next_id(pid)::7>>
    n
  end

  @doc """
  Return a locally unique non-negative integer.
  Provide the process of the GlobalId GenServer you
  are connecting you.
  """
  @spec next_id(pid()) :: non_neg_integer
  def next_id(pid), do: GenServer.call(pid, :next_id)

  @doc """
  Returns your node id as an integer.
  It will be greater than or equal to 0 and less than 1024.
  It is guaranteed to be globally unique.
  """
  @spec node_id() :: non_neg_integer
  def node_id, do: 18

  @doc """
  Returns timestamp since the epoch in microseconds.
  """
  @spec timestamp() :: non_neg_integer
  def timestamp, do: :os.system_time(:microsecond)

  #
  # GenServer Functionality
  #
  #

  @doc """
  Start our GlobalId GenServer, with our next_id being 0.
  """
  @impl true
  def init(_) do
    {:ok, %{counter: 0}}
  end

  @impl true
  def handle_call(:next_id, _from, %{counter: counter}) do
    {:reply, counter, %{counter: counter + 1}}
  end
end
```

#### Debugging our Implementation

From the elixir shell (within a project holding our `GlobalId`)

```elixir
iex -S mix
```

We can start a new GlobalId server.

```elixir
iex> {:ok, pid} = GenServer.start_link(GlobalId, :ok)
```

And then use the `pid` to request the next IDs.

```elixir
iex> GlobalId.get_id(pid)
```

We can also test our `next_id()` function.

```elixir
iex> GlobalId.next_id(pid)
```


#### Implementing the Node ID

Right now our NodeId is hard-coded, let's expand that
to grab from our internal state.

```elixir
defmodule GlobalId do
  use GenServer

  @moduledoc """
  GlobalId module contains an implementation of a guaranteed globally unique id system.
  """

  @doc """
  Return a globally unique 64-bit non-negative integer.

  Each node can be represented with 10 bits (2^10 = 1024)
  we will use our unique node prefix, and then the
  remaining 54 bits to be unique within the node.

  The underlying call to timestamp is not guaranteed to be
  monotonic, and we do not support two calls within the
  same microsecond, but this is a good start.
  """
  @spec get_id(pid()) :: non_neg_integer
  def get_id(pid), do: GenServer.call(pid, :get_id)

  @doc """
  Returns your node id as an integer.
  It will be greater than or equal to 0 and less than 1024.
  It is guaranteed to be globally unique.
  """
  @spec node_id(pid()) :: non_neg_integer
  def node_id(pid), do: GenServer.call(pid, :node_id)

  @doc """
  Returns timestamp since the epoch in microseconds.
  """
  @spec timestamp() :: non_neg_integer
  def timestamp, do: :os.system_time(:microsecond)

  #
  # GenServer Functionality
  #
  #

  @doc """
  Start our GlobalId GenServer, with our next_id being 0.

  You can start your server with `start_link/2` and then
  send the message `:get_id` the PID as shown below.

      iex> {:ok, pid} = GenServer.start_link(GlobalId, 18)
      iex> GenServer.call(pid, :get_id)

  These behaviours are also captured in the API above.
  """
  @impl true
  def init(node_id) do
    {:ok, %{node_id: node_id, counter: 0}}
  end

  @impl true
  def handle_call(:node_id, _from, %{node_id: node_id} = state) do
    {:reply, node_id, state}
  end

  @impl true
  def handle_call(:get_id, _from, %{node_id: node_id, counter: counter} = state) do
    <<id::size(64)>> = <<node_id::10, timestamp()::47, counter::7>>
    {:reply, id, %{state | counter: counter + 1}}
  end
end
```

### Testing

The testing of our ID generator can be split into

* Is it correct?
* Is it fast enough?
* Is it guaranteed unique?

#### Is is correct?

A fast service that returns incorrect results is somewhat useless.
So our first tests focus on example-driven testing (aka unit testing)
to see if the ID generator is doing what we expect.

There are two tests at this level.  Our function should be monotonic
(ever-increasing), and supports sub-millisecond access.

```elixir
test "should be monotonically increasing" do
  {:ok, pid1} = GenServer.start_link(GlobalId, 1)
  first = GlobalId.get_id(pid1)
  second = GlobalId.get_id(pid1)
  third = GlobalId.get_id(pid1)
  assert first < second
  assert second < third
end
```

We also want to show that the last 7 bits of our solution do cycle
through at least 100 values so that our time-based approach could
(in theory) support the required 100,000 transactions a second
(i.e. 100/ms).

```elixir
  test "theoretically support 100 (2^7) calls per millisecond" do
    {:ok, pid1} = GenServer.start_link(GlobalId, 1)

    allIds = Enum.map(0..129, fn _ -> GlobalId.get_id(pid1) end)

    <<_::57, num_0::7>> = <<Enum.at(allIds, 0)::64>>
    assert num_0 == 0

    <<_::57, num_1::7>> = <<Enum.at(allIds, 1)::64>>
    assert num_1 == 1

    <<_::57, num_127::7>> = <<Enum.at(allIds, 127)::64>>
    assert num_127 == 127

    <<_::57, num_128::7>> = <<Enum.at(allIds, 128)::64>>
    assert num_128 == 0

    <<_::57, num_129::7>> = <<Enum.at(allIds, 129)::64>>
    assert num_129 == 1
  end
end
```

#### Is it fast enough?

Next, we consider performance.  For that, we used [benchee](https://hex.pm/packages/benchee)

```elixir
@tag perf: true
test "can we get 100k per second" do
  {:ok, pid1} = GenServer.start_link(GlobalId, 1)

  Benchee.run(
    %{
      "get_id" => fn -> GlobalId.get_id(pid1) end
    },
    warmup: 0,
    time: 10,
    parallel: 1
  )
end
```

We will be calling our `&get_id/1` function over and
over for 10 seconds.

To run the performance test we do

```bash
mix test test/perf_test.exs --include perf:true
```

This was tested on

```
Operating System: macOS
CPU Information: Intel(R) Core(TM) i7-6567U CPU @ 3.30GHz
Number of Available Cores: 4
Available memory: 16 GB
Elixir 1.10.3
Erlang 22.3
```

And produced the following output (we ran the test several times
each row representing one 10s test).

| Name | ips | average | deviation | median | 99th %
| --- | --- | --- | --- | --- | --- |
| get_id | 525.40 K | 1.90 μs | ±1584.91% | 2 μs | 3 μs
| get_id | 401.50 K | 2.49 μs | ±1510.79% | 1.98 μs | 15.98 μs
| get_id | 437.85 K | 2.28 μs | ±1473.27% | 2 μs | 13 μs
| get_id | 437.70 K | 2.28 μs | ±1691.43% | 2 μs | 15 μs

The definition of each field is below:

* **name** - the of the test
* **ips** - iterations per second, aka how often can the given function be executed within one second (the higher the better - good for graphing), only for run times
* **average** - average execution time/memory usage (the lower the better)
* **deviation** - standard deviation (how much do the results vary), given as a percentage of the average (raw absolute values also available)
* **median** - when all measured values are sorted, this is the middle value. More stable than the average and somewhat more likely to be a typical value you see, for the most typical value see mode. (the lower the better)
* **99th %** - 99th percentile, 99% of all measured values are less than this - worst-case performance-ish

The results seem to indicate our ID generator will work
well at producing 100k IDs per second.

#### Is it guaranteed unique?

We can test our uniqueness guarantee by launching 1024 nodes
and concurrently requesting IDs from them and ensuring
the resulting list is unique.

To run the test

```bash
mix test test/global_unique_test.exs  --include global:true
```

And here is the implementation (looking at 50k requests)

```elixir
@tag global: true
test "globally unique" do

  globals = 0..1023
  |> Enum.map(fn node_id ->
    {:ok, pid} = GenServer.start_link(GlobalId, node_id)
    pid
  end)

  num_iterations = 50_000
  unique_numbers = 1..num_iterations
  |> Enum.map(fn _ ->
    Task.async(fn ->
      [pid] = Enum.take_random(globals, 1)
      GenServer.call(pid, :get_id)
    end)
  end)
  |> Enum.map(&Task.await/1)
  |> Enum.uniq
  |> Enum.count

  assert unique_numbers == num_iterations
end
```

### Summary

Based on theoretical analysis of bitstrings, mixed with
some engineering benchmarks, our solution seems to provide
a GlobalId generator that offers unsynchronized unique IDs
between upto 1024 nodes.

The current solution will last for 4.5k years before we
run out of numbers, and if that is of concern then the
recommendation would be to go with a 128-bit integer
split as follows.

```
XXXXXXXXXX YYYYY.........YYYYY  ZZZZZ.........ZZZZ
  20 bits        71 bits              17 bits
```

Using 20 bits allows for a million nodes, and 17-bit
counter allows for 100k every millisecond, which still
leaves us with 71 bits for epoch time or a trillion-years
(well past the 4.5B years that our sun will survive).

You can [visit the source on GitHub](https://github.com/work-samples/global_id)