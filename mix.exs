defmodule Dungen.MixProject do
  use Mix.Project

  def project do
    [
      app: :dungen,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Dungen.Application, []}
    ]
  end

  defp deps do
    [
      {:poison, "~> 3.0"},
      {:plug, "~> 1.6"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
