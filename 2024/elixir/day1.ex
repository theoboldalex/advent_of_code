defmodule DayOne do
  @input_path "test.txt"

  def stream_file, do: File.stream!("#{__DIR__}/#{@input_path}")

  def get_line_parts do
    stream_file()
    |> Enum.map(fn l ->
      l
      |> String.trim()
      |> String.split(~r/\s+/, parts: 2)
    end)
  end

  def get_left do
    get_line_parts()
    |> Enum.map(&String.to_integer(hd(&1)))
  end

  def get_right do
    get_line_parts()
    |> Enum.map(fn l ->
      case l do
        [_, tail] -> String.to_integer(tail)
        [_] -> ""
      end
    end)
  end

  def part_one do
    Enum.zip(Enum.sort(get_left()), Enum.sort(get_right()))
    |> Enum.map(fn {l, r} -> abs(l - r) end)
    |> Enum.reduce(&(&1 + &2))
  end

  def part_two do
    left = get_left()
    right = Enum.frequencies(get_right())

    Enum.map(left, &(&1 * Map.get(right, &1, 0)))
    |> Enum.reduce(&(&1 + &2))
  end
end

IO.puts("part one: #{DayOne.part_one()}")
IO.puts("part two: #{DayOne.part_two()}")
