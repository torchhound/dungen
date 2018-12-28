use Mix.Config

config :dungen, Dungen.Endpoint, port: String.to_integer(System.get_env("PORT") || "7070")