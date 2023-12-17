defmodule Portfolio.Application do
  use Application

  @impl Application
  def start(_start_type, _start_args) do
    children = [
      {Portfolio.LiveReload,
       file_watcher: [
         dirs: ["lib/portfolio.ex"],
         latency: 0
       ]}
    ]

    opts = [strategy: :one_for_one, supervisor: Portfolio.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
