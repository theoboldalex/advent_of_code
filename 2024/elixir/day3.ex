defmodule DayThree do
  @input_path "real.txt"

  def part_one do
    contents = read_input()
    pattern = ~r/mul\((\d{1,3}),(\d{1,3})\)/

    matches = Regex.scan(pattern, contents)

    Enum.reduce(matches, 0, fn [_, l, r], acc ->
      acc + String.to_integer(l) * String.to_integer(r)
    end)
  end

  defp read_input, do: File.read!("#{__DIR__}/#{@input_path}")
end

DayThree.part_one() |> IO.inspect()
