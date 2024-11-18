defmodule Day3 do
  def part_one(input) do
    input
    |> read_input()
    |> Enum.chunk_every(2, 1, :discard)
  end

  defp read_input(path), do: File.read!("#{__DIR__}/#{path}") |> get_lines()

  defp get_lines(str), do: str |> String.trim() |> String.split(~r{\n})
end

IO.inspect(Day3.part_one("test.txt"))
