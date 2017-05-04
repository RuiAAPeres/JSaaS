defmodule JSaaS.MessageUtils do
  @doc ~S"""
  flip the message field of a {"message":"foo"} json

  # Examples:

      iex> JSaaS.MessageUtils.flipMsg("{\"message\":\"foo\"}")
      "{\"message\":\"oof\"}"
  """
  @spec flipMsg(String.t) :: String.t
  def flipMsg(text) do
    text
    |> String.reverse
  end

  def identity(text) do
    text
  end
end
