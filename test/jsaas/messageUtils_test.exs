defmodule JSaaS.Doctests do
  use ExUnit.Case, async: true
  doctest JSaaS.Router
  doctest JSaaS.MessageUtils
end

