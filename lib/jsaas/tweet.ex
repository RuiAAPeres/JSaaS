defmodule JSaaS.Tweet do
  use Poison.Encode

  @derive [Poison.Encoder]
  defstruct message: nil

  def to_tweet(tweetsResponse) when is_list(tweetsResponse) do
    tweet = tweetsResponse
    |> Enum.map(&(&1.text))
    |> Enum.random
    |> init_from_message
    |> Poison.encode!
  end

  def init_from_message(tweetMessage) do
    %JSaaS.Tweet{message: tweetMessage}
  end
end
