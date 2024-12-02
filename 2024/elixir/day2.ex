defmodule DayTwo do
  @input_path "real.txt"

  def get_lines do
    File.read!("#{__DIR__}/#{@input_path}")
    |> String.trim()
    |> String.split(~r/\n/)
    |> Enum.map(fn line ->
      String.split(line)
      |> Enum.map(&String.to_integer/1)
    end)
  end

  def part_one do
    get_lines()
    |> Enum.filter(&is_report_safe?/1)
    |> length()
  end

  def part_two do
    nil
  end

  defp is_report_safe?(report), do: asc?(report) or desc?(report)

  defp asc?([]), do: true
  defp asc?([_]), do: true
  defp asc?([a, b | rest]) when a < b and b - a <= 3, do: asc?([b | rest])
  defp asc?(_), do: false

  defp desc?([]), do: true
  defp desc?([_]), do: true
  defp desc?([a, b | rest]) when a > b and a - b <= 3, do: desc?([b | rest])
  defp desc?(_), do: false
end

IO.puts("part one: #{DayTwo.part_one()}")
IO.puts("part two: #{DayTwo.part_two()}")
