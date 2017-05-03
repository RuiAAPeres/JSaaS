defmodule JSaaS.Router do
  use Plug.Router
  use Poison.Encode

  plug :match
  plug :dispatch

  @spec getTweet(String.t) :: String.t
  def getTweet(account_name) do
    options = [screen_name: account_name,
    count: 200,
    exclude_replies: true,
    include_rts: false]

    ExTwitter.user_timeline(options)
    |> JSaaS.Tweet.to_tweet
  end

  get "/hitMeJaden" do
    response = getTweet("officialjaden")

    send_resp(conn, 200, response)
  end

  get "/flipMeJaden" do
    response = getTweet("officialjaden")
    |> JSaaS.MessageUtils.flipMsg

    send_resp(conn, 200, response)
  end

  match _, do: send_resp(conn, 404, "Oops!")
end
