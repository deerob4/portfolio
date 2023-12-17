defmodule Portfolio.MixProject do
  use Mix.Project

  def project do
    [
      app: :portfolio,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Portfolio.Application, []},
      extra_applications: [:logger, :runtime_tools, :observer, :wx]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix_live_view, "~> 0.20.1"},
      {:esbuild, "~> 0.8.1"},
      {:nimble_publisher, "~> 1.1"},
      {:tailwind, "~> 0.2.2", runtime: Mix.env() == :dev},
      {:phoenix_copy, "~> 0.1.3"},
      {:file_system, "~> 1.0", override: true},
      {:bandit, "~> 1.0", dev: true}

      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp aliases do
    [
      "site.build": ["build", "phx.copy default", "esbuild default --minify"]
    ]
  end
end
