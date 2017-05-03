defmodule JSaaS.MessageUtils do
  @doc ~S"""
  flip the message field of a {"message":"foo"} json

  # Examples:

      iex> JSaaS.MessageUtils.flipMsg("{\"message\":\"foo\"}")
      "{\"message\":\"oof\"}"
  """
  @spec flipMsg(String.t) :: String.t
  def flipMsg(json_str) do
    json_str
    |> Poison.decode!
    |> Map.get("message")
    |> String.reverse
    |> (&%{ :message => &1 }).()
    |> Poison.encode!
  end
end