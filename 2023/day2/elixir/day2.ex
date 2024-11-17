defmodule Day2 do
  def part_one_answer(input_file) do
    input_file
    |> read_input()
    |> Enum.map(&get_game_state/1)
    |> Enum.with_index()
    |> Enum.filter(fn {v, _} -> not Enum.member?(v, false) end)
    |> Enum.map(fn {_, index} -> index + 1 end)
    |> Enum.reduce(&(&1 + &2))
  end

  defp read_input(path), do: File.read!("#{__DIR__}/#{path}") |> get_lines()

  defp get_lines(str), do: str |> String.trim() |> String.split(~r{\n})

  defp get_game_state(line) do
    games = String.split(line, ";")
    pattern = ~r/([0-9]+) (red|green|blue)/

    Enum.map(games, fn game ->
      matches = Regex.scan(pattern, game)

      game = %{
        red: 0,
        green: 0,
        blue: 0
      }

      Enum.reduce(matches, game, fn [_, count, colour], acc ->
        count = String.to_integer(count)
        key = String.to_atom(colour)
        Map.update(acc, key, count, &(&1 + count))
      end)
      |> is_game_legal()
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
