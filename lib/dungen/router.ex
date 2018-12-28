defmodule Dungen.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(message()))
  end

  match _ do
    send_resp(conn, 404, "Requested resource not found!")
  end

  defp message do
    Poison.encode!(%Dungen.Dungeon{name: Dungen.Generators.nameGenerator, map: Dungen.Generators.dungeonGenerator})
  end
end