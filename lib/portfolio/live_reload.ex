defmodule Portfolio.LiveReload do
  @moduledoc """
  Rebuilds and reloads the portfolio site when files change.
  """

  use Supervisor

  def start_link(args) do
    Supervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init(args) do
    children = [
      {Registry, keys: :unique, name: Portfolio.LiveReload.Registry},
      {Portfolio.LiveReload.FileWatcher, Keyword.get(args, :file_watcher)},
      {Bandit, plug: Portfolio.LiveReload.Router, scheme: :http, port: 4000}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
