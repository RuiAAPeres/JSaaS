defmodule JSaaS.Tweet do

  @derive [Poison.Encoder]
  defstruct text: nil

  def to_single_tweet(tweetsResponse, transformation) when is_list(tweetsResponse) do
    tweetsResponse
    |> Enum.map(&(&1.text))
    |> Enum.filter(&JSaaS.Validator.is_not_uri?/1)
    |> Enum.random
    |> transformation.()
    |> init_from_message
    |> Poison.encode!
  end

  def init_from_message(tweetMessage) do
    %JSaaS.Tweet{text: tweetMessage}
  end
end
