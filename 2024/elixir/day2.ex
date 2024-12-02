defmodule DayTwo do
  @input_path "test.txt"

  def get_lines do
    File.read!("#{__DIR__}/#{@input_path}")
    |> String.trim()
    |> String.split(~r/\n/)
    |> Enum.map(fn line ->
      String.split(line)
      |> Enum.map(&String.to_integer/1)
      |> List.to_tuple()
    end)
  end

  def part_one do
    get_lines()
    |> IO.inspect()
  end

  def part_two do
    nil
  end
end

# IO.puts("part one: #{DayTwo.part_one()}")
# IO.puts("part two: #{DayTwo.part_two()}")
DayTwo.part_one()
