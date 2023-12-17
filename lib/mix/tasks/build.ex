defmodule Mix.Tasks.Build do
  @moduledoc false

  use Mix.Task

  @impl true
  def run(_) do
    {microseconds, :ok} = :timer.tc(&Portfolio.build/0)
    ms = microseconds / 1000
    IO.puts("Built in #{ms}ms")
  end
end
