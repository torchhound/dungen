defmodule Dungen.Generators do
  def dungeonGenerator(x, y) do
    randomWalk(5, 8, x, y, {Enum.random(-1..1), Enum.random(-1..1)}, create2dArray(".", x, y, []), :rand.uniform(y), :rand.uniform(x), {Enum.random(0..1), Enum.random(0..1)}, 0, Enum.random(1..8))
  end

  defp create2dArray(char, x, y, map) do
    if (y != 0) do
      create2dArray(char, x, y - 1, List.insert_at(map, y, List.duplicate(char, x)))
    else
      map
    end
  end

  defp makeNegative(num), do: -num

  defp randomWalk(maxTunnels, maxLength, x, y, direction, map, currentRow, currentColumn, lastDirection, tunnelLength, randomLength) do
    if (maxTunnels != 0) do
      if ((elem(direction, 0) == makeNegative(elem(lastDirection, 0)) && elem(direction, 1) == makeNegative(elem(lastDirection, 1))) || (elem(direction, 0) == elem(lastDirection, 0 && elem(direction, 1) == elem(lastDirection, 1)))) do
        randomWalk(maxTunnels, maxLength, x, y, {Enum.random(0..1), Enum.random(0..1)}, map, currentRow, currentColumn, lastDirection, tunnelLength, randomLength)
      else
        if (((currentRow == 0) && (elem(direction, 0) == -1)) ||
            ((currentColumn == 0) && (elem(direction, 1) == -1)) ||
            ((currentRow == y - 1) && (elem(direction, 0) == 1)) ||
            ((currentColumn == x - 1) && (elem(direction, 1) == 1))) do
          randomWalk(maxTunnels, maxLength, x, y, {Enum.random(0..1), Enum.random(0..1)}, map, currentRow, currentColumn, lastDirection, 0, Enum.random(1..maxLength))
        else
          if (tunnelLength == randomLength) do
            randomWalk(maxTunnels - 1, maxLength, x, y, {Enum.random(-1..1), Enum.random(-1..1)}, map, currentRow, currentColumn, direction, 0, Enum.random(1..maxLength))
          else
            newRow = List.replace_at(Enum.at(map, currentRow), currentColumn, "#")
            randomWalk(maxTunnels, maxLength, x, y, direction, List.replace_at(map, currentRow, newRow), currentRow + elem(direction, 0), currentColumn + elem(direction, 1), lastDirection, tunnelLength + 1, randomLength)
          end
        end
      end
    else
      map
    end
  end

  def nameGenerator do
    syllables = ["gah", "mar", "gir", "dol", "hec", "car", "loq", "rot", "mon", "fey", "shi", "zen", "don", "bul", "kel", "lec", "rom", "lab"]
    syllablesInName = Enum.random(2..5)
    nameLoop(syllables, "", syllablesInName)
  end

  defp nameLoop(syllables, name, count) do
    if (count != 0) do
      nameLoop(syllables, "#{name}#{Enum.at(syllables, Enum.random(0..length(syllables)))}", count - 1)
    else 
      name
    end
  end
end