defmodule DungenTest do
  use ExUnit.Case
  doctest Dungen

  test "greets the world" do
    assert Dungen.hello() == :world
  end
end
