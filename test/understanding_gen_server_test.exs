defmodule UnderstandingGenServerTest do
  use ExUnit.Case
  doctest UnderstandingGenServer

  test "greets the world" do
    assert UnderstandingGenServer.hello() == :world
  end
end
