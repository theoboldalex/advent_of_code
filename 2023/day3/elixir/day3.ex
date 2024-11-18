defmodule Day3 do
  def part_one(input) do
    input
    |> read_input()
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.map(&get_part_numbers/1)
  end

  defp get_part_numbers(chunk) do
    chunk
    |> Enum.map(fn s ->
      s
      |> String.graphemes()
      |> Enum.with_index()
      |> Enum.map(fn {k, v} ->
        {k, v}
      end)
    end)
  end

  defp is_special_char?(char), do: char not in ["."] and not is_number?(char)

  defp is_number?(char), do: Regex.match?(~r/^\d$/, char)

  defp(read_input(path), do: File.read!("#{__DIR__}/#{path}") |> get_lines())

  defp get_lines(str), do: str |> String.trim() |> String.split(~r{\n})
end

Day3.part_one("test.txt")
|> IO.inspect()
