defmodule DayThree do
  @input_path "real.txt"
  def part_one do
    contents = File.read!("#{__DIR__}/#{@input_path}")
    pattern = ~r/mul\((\d{1,3}),(\d{1,3})\)/

    matches = Regex.scan(pattern, contents)

    Enum.map(matches, fn [_, l, r] ->
      String.to_integer(l) * String.to_integer(r)
    end)
    |> Enum.reduce(&(&1 + &2))
  end
end

DayThree.part_one() |> IO.inspect()
