defmodule Dungen.Endpoint do
  use Plug.Router

  require Logger
  
  plug(Plug.Logger, log: :debug)
  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  )

  plug(:dispatch)

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  def start_link(_opts) do
    with {:ok, [port: port] = config} <- config() do
      Logger.info("Starting server at http://localhost:#{port}/")
      Plug.Cowboy.http(__MODULE__, [], config)
    end
  end

  forward("/generate", to: Dungen.Router)

  defp config, do: Application.fetch_env(:dungen, __MODULE__)

  match _ do
    send_resp(conn, 404, "Requested resource not found!")
  end
end