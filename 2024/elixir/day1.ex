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
    [Enum.sort(get_left()), Enum.sort(get_right())]
    |> Enum.zip()
    |> Enum.reduce(0, fn {l, r}, acc ->
      abs(l - r) + acc
    end)
  end

  def part_two do
    left = get_left()
    right = Enum.frequencies(get_right())

    Enum.reduce(left, 0, fn n, acc ->
      n * Map.get(right, n, 0) + acc
    end)
  end
end

IO.puts("part one: #{DayOne.part_one()}")
IO.puts("part two: #{DayOne.part_two()}")
