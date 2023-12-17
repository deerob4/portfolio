defmodule Portfolio.LiveReload.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    index = Path.join("out", "index.html")
    contents = File.read!(index)
    send_resp(conn, 200, contents)
  end

  get "assets/*rest" do
    asset_path = Path.join(["out", "assets", Enum.join(rest, "/")])
    data = File.read!(asset_path)
    send_resp(conn, 200, data)
  end

  get "/projects" do
    index = Path.join("out", "projects.html")
    contents = File.read!(index)
    send_resp(conn, 200, contents)
  end

  get "/live_reload" do
    conn
    |> WebSockAdapter.upgrade(Portfolio.LiveReload.Server, [], timeout: 60_000)
    |> halt()
  end
end
