defmodule Werld.Mixfile do
  use Mix.Project

  def project do
    [
        app: :werld,
        version: "0.0.1",
        elixir: "~> 1.0",
        deps: deps
    ]
  end

  def application do
    [
        applications: [
          :logger, :cowboy, :exprotobuf, :gproc, :runtime_tools
        ],
        mod: {Werld.Cowboy, []}
    ]
  end

  defp deps do
    [
        {:cowboy, "~> 1.0.0"},
        {:exprotobuf, "~> 1.2.0"},
        {:gproc, "0.6.1"}
    ]
  end
end
