defmodule Dungen.Dungeon do
  @derive [Poison.Encoder]
  defstruct [:name, :map]
end