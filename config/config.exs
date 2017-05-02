use Mix.Config

config :jsaas, cowboy_port: System.get_env("PORT")
config :extwitter, :oauth, [
   consumer_key: System.get_env("consumer_key"),
   consumer_secret: System.get_env("consumer_secret"),
   access_token: System.get_env("access_token"),
   access_token_secret: System.get_env("access_token_secret")
]
