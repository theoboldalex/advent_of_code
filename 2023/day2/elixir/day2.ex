defmodule Day2 do
  def answer(input_file) do
    input_file
    |> read_input()
    |> Enum.map(&get_line_count_map/1)
    |> Enum.map(&is_game_legal/1)
    |> Enum.with_index()
    |> Enum.filter(fn {v, _} -> v == true end)
    |> Enum.map(fn {_, index} -> index + 1 end)
    |> Enum.reduce(&(&1 + &2))
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
      colour_key = String.to_atom(color)
      Map.update(acc, colour_key, count, &(&1 + count))
    end)
  end

  defp is_game_legal(game) do
    limits = %{
      red: 12,
      green: 13,
      blue: 14
    }

    game[:red] <= limits[:red] and game[:green] <= limits[:green] and game[:blue] <= limits[:blue]
  end
end

IO.inspect(Day2.answer("1_test.txt"))
