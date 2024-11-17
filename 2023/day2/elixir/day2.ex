defmodule Day2 do
  def part_one_answer(input_file) do
    input_file
    |> read_input()
    |> Enum.map(&get_game_state/1)
    |> Enum.map(&get_possible_games/1)
    |> Enum.with_index()
    |> Enum.filter(fn {v, _} -> not Enum.member?(v, false) end)
    |> Enum.map(fn {_, index} -> index + 1 end)
    |> Enum.reduce(&(&1 + &2))
  end

  def part_two_answer(input_file) do
    input_file
    |> read_input()
    |> Enum.map(&get_game_state/1)
    |> Enum.map(&get_max_from_game/1)
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
    end)
  end

  defp get_possible_games(games) do
    limits = %{
      red: 12,
      green: 13,
      blue: 14
    }

    games
    |> Enum.map(fn game ->
      game[:red] <= limits[:red] and
        game[:green] <= limits[:green] and
        game[:blue] <= limits[:blue]
    end)
  end

  defp get_max_from_game(game) do
    red = game |> Enum.map(fn map -> map[:red] end)
    green = game |> Enum.map(fn map -> map[:green] end)
    blue = game |> Enum.map(fn map -> map[:blue] end)

    Enum.max(red) * Enum.max(green) * Enum.max(blue)
  end
end
