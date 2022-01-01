defmodule Main do
  def run() do
    title() |> print()

    case System.argv() do
      [] ->
        help()

      ["book", name] ->
        print(["Creating a new book:", name])
        File.mkdir_p("./books/#{name}")
        File.touch("./books/#{name}/readme.md")

      args ->
        print(["Unknown command: " | args])
    end
  end

  def title() do
    [
      "-------------",
      "   WRITING   ",
      "-------------"
    ]
  end

  def help() do
    [
      "elixir writing.exs <name-of-book>"
    ]
  end

  def print(inputs) do
    for line <- inputs do
      IO.puts(line)
    end
  end
end

Main.run()
