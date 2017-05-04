defmodule JSaaS.MessageUtils do
  @doc ~S"""
  flip the message field of a {"message":"foo"} json

  # Examples:
      iex> JSaaS.MessageUtils.flip_message("a message")
      "egassem a"
  """
  @spec flip_message(String.t) :: String.t
  def flip_message(text) do
    text |> String.reverse
  end

  def identity(text) do
    text
  end
end
