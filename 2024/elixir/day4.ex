defmodule DayFour do
  @input_path "test.txt"

  def part_one do
    nil
  end

  def part_two do
    nil
  end

  defp read_input, do: File.read!("#{__DIR__}/#{@input_path}")
end

IO.puts("part one: #{DayFour.part_one()}")
IO.puts("part two: #{DayFour.part_two()}")
