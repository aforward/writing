# Generating Globally Unique IDs
#meta sort 2020-05-26
#meta tags[] elixir
### May 29, 2020

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
