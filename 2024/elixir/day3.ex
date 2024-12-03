defmodule DayThree do
  @input_path "test.txt"

  def part_one do
    sum_matches(read_input())
  end

  def part_two do
    parts = Regex.split(~r/do\(\)|don't\(\)/, read_input(), include_captures: true)
    # because the start of the input has no do() call, save the head for later
    [hd | tail] = parts

    do_blocks =
      Enum.chunk_every(tail, 2)
      |> Enum.filter(&(hd(&1) == "do()"))
      |> Enum.map(&List.last/1)

    Enum.reduce([hd | do_blocks], 0, fn block, acc ->
      acc + sum_matches(block)
    end)
  end

  defp read_input, do: File.read!("#{__DIR__}/#{@input_path}")

  defp sum_matches(contents) do
    pattern = ~r/mul\((\d{1,3}),(\d{1,3})\)/

    matches = Regex.scan(pattern, contents)

    Enum.reduce(matches, 0, fn [_, l, r], acc ->
      acc + String.to_integer(l) * String.to_integer(r)
    end)
  end
end

IO.puts("part one: #{DayThree.part_one()}")
IO.puts("part two: #{DayThree.part_two()}")
