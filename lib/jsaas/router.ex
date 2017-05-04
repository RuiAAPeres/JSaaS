defmodule JSaaS.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  @spec getTweet(String.t, String.t :: String.t) :: String.t
  def getTweet(account_name, transformation) do
    options = [screen_name: account_name,
    count: 200,
    exclude_replies: true,
    include_rts: false]

    ExTwitter.user_timeline(options)
    |> JSaaS.Tweet.to_single_tweet(transformation)
  end

  get "/hitMeJaden" do
    response = getTweet("officialjaden", &JSaaS.MessageUtils.identity/1)

    send_resp(conn, 200, response)
  end

  get "/flipMeJaden" do
    response = getTweet("officialjaden", &JSaaS.MessageUtils.flip_message/1)

    send_resp(conn, 200, response)
  end

  get "/hitMe:user" do
    response = getTweet(user, &JSaaS.MessageUtils.identity/1)

    send_resp(conn, 200, response)
  end

  get "/flipMe:user" do
    response = getTweet(user, &JSaaS.MessageUtils.flip_message/1)

    send_resp(conn, 200, response)
  end

  match _, do: send_resp(conn, 404, "Oops!")
end
