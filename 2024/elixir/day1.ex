defmodule DayOne do
  @input_path "test.txt"

  def get_sides do
    File.read!("#{__DIR__}/#{@input_path}")
    |> String.split(~r/\n/, trim: true)
    |> Enum.map(fn l ->
      String.split(l)
      |> Enum.map(&String.to_integer/1)
      |> List.to_tuple()
    end)
    |> Enum.unzip()
  end

  def part_one do
    {left, right} = get_sides()

    [Enum.sort(left), Enum.sort(right)]
    |> Enum.zip()
    |> Enum.reduce(0, fn {l, r}, acc ->
      abs(l - r) + acc
    end)
  end

  def part_two do
    {left, right} = get_sides()
    freq = Enum.frequencies(right)

    Enum.reduce(left, 0, fn n, acc ->
      n * Map.get(freq, n, 0) + acc
    end)
  end
end

IO.puts("part one: #{DayOne.part_one()}")
IO.puts("part two: #{DayOne.part_two()}")
