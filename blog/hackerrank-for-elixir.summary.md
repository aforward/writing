# HackerRank Template in Elixir
#meta sort 2019-05-27
#meta tags[] elixir hackerrank
### May 27, 2019

Here's a template for answering HackerRank in Elixir.  This is
based on the [Two Character](https://www.hackerrank.com/challenges/two-characters/problem)
question

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

Now go forth and HackerRank!!!
