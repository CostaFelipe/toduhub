defmodule TodohubTest do
  use ExUnit.Case
  doctest Todohub

  test "greets the world" do
    assert Todohub.hello() == :world
  end
end
