defmodule JSaaS.Router do
  use Plug.Router
  use Poison.Encode

  plug :match
  plug :dispatch

  get "/hitMeJaden" do

    options = [screen_name: "officialjaden",
    count: 200,
    exclude_replies: true,
    include_rts: false]

    response = ExTwitter.user_timeline(options)
    |> JSaaS.Tweet.to_tweet

    send_resp(conn, 200, response)
  end

  match _, do: send_resp(conn, 404, "Oops!")
end
