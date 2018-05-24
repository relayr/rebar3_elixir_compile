defmodule PlugDemo.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/" do
    conn
    |> put_resp_header("content-type", "application/json")
    |> send_resp(200, "{\"result\":\"success\"}")
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end

