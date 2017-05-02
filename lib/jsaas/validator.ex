defmodule JSaaS.Validator do
  def is_not_uri?(text) do
    uri = URI.parse(text)
    uri.scheme == nil || false
  end
end
