defmodule Day2 do
  def answer(input_file) do
    input_file
    |> read_input()
    |> Enum.map(&get_line_count_map/1)
  end

  defp read_input(path), do: File.read!("#{__DIR__}/#{path}") |> get_lines()

  defp get_lines(str), do: str |> String.trim() |> String.split(~r{\n})

  defp get_line_count_map(line) do
    pattern = ~r/([0-9]+) (red|green|blue)/

    colour_map = %{
      red: 0,
      blue: 0,
      green: 0
    }

    matches = Regex.scan(pattern, line)

    Enum.reduce(matches, colour_map, fn [_, count, color], acc ->
      count = String.to_integer(count)
      Map.update(acc, String.to_atom(color), count, &(&1 + count))
    end)
  end
end

IO.inspect(Day2.answer("1_test.txt"))
