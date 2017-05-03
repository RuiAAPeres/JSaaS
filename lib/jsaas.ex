defmodule JSaaS.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    require Logger
    require ExTwitter

    port = Application.get_env(:jsaas, :cowboy_port, "8080") |> String.to_integer

    oauth = Application.get_env(:extwitter, :oauth, nil)
    ExTwitter.configure(oauth)

    children = [
      Plug.Adapters.Cowboy.child_spec(:http, JSaaS.Router, [], port: port)
    ]

    Logger.info("Here we go...")
    Logger.info("try `localhost:#{port}/hitMeJaden`")

    opts = [strategy: :one_for_one, name: JSaaS.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
