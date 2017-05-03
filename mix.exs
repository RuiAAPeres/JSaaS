defmodule JSaaS.Mixfile do
  use Mix.Project

  def project do
    [app: :jsaas,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger],
    mod: {JSaaS.Application, []}]
  end

  defp deps do
    [{:cowboy, "~> 1.1.2"},
    {:plug, "~> 1.3.4"},
    {:extwitter, "~> 0.8.3"},
    {:poison, "~> 2.0"},
    {:dialyxir, "~> 0.5", only: [:dev], runtime: false}]
  end
end
