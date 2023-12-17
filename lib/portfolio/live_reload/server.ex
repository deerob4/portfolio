defmodule Portfolio.LiveReload.Server do
  @behaviour WebSock

  @pid_key "reload_server"

  @doc """
  Sends a reload message to the socket.
  """
  def reload() do
    case Registry.lookup(Portfolio.LiveReload.Registry, @pid_key) do
      [{pid, _}] ->
        send(pid, :reload)
        :ok

      [] ->
        {:error, :no_socket}
    end
  end

  @impl true
  def init(options) do
    {:ok, _} = Registry.register(Portfolio.LiveReload.Registry, @pid_key, nil)
    {:ok, options}
  end

  @impl true
  def handle_in({_message, _opcode}, state) do
    {:ok, state}
  end

  @impl true
  def terminate(_, state) do
    {:ok, state}
  end

  @impl true
  def handle_info(:reload, state) do
    {:push, [{:text, "reload"}], state}
  end
end
