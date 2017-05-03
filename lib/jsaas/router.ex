defmodule JSaaS.Router do
  use Plug.Router
  use Poison.Encode

  plug :match
  plug :dispatch

  def getJaden do
    options = [screen_name: "officialjaden",
    count: 200,
    exclude_replies: true,
    include_rts: false]

    ExTwitter.user_timeline(options)
    |> JSaaS.Tweet.to_tweet
  end

  get "/hitMeJaden" do
    response = getJaden

    send_resp(conn, 200, response)
  end

  get "/flipMeJaden" do
    response = getJaden
    |> String.reverse

    send_resp(conn, 200, response)
  end

  match _, do: send_resp(conn, 404, "Oops!")
end
