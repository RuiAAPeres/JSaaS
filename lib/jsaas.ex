defmodule JSaaS.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    require Logger
    require ExTwitter

    oauth = Application.get_env(:extwitter, :oauth, nil)
    ExTwitter.configure(oauth)

    children = [
      Plug.Adapters.Cowboy.child_spec(:http, JSaaS.Router, [], port: get_port())
    ]

    Logger.info(System.get_env("PORT"))
    Logger.info("Here we go...")
    Logger.info("try `localhost:8080/hitMeJaden`")

    opts = [strategy: :one_for_one, name: JSaaS.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp get_port() do
    port_env_variable = System.get_env("PORT")
    if is_nil(port_env_variable) do
      4000
    else
      String.to_integer(port_env_variable)
    end
  end
end
