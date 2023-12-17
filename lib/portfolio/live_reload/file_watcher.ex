defmodule Portfolio.LiveReload.FileWatcher do
  @moduledoc """
  Watches the source files and rebuilds the site when they change.
  """

  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init(args) do
    {:ok, watcher_pid} = FileSystem.start_link(args)
    :ok = FileSystem.subscribe(watcher_pid)
    IO.puts("Started file system watcher")
    :ok = build()
    {:ok, %{watcher_pid: watcher_pid}}
  end

  @impl true
  def handle_info(_msg, state) do
    :ok = build()
    {:noreply, state}
  end

  defp build() do
    {output, 0} = System.cmd("mix", ["site.build"])
    IO.puts(output)
    Portfolio.LiveReload.Server.reload()
    :ok
  end
end
