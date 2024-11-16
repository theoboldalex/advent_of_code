defmodule Day2 do
  def read_input(path), do: File.read!(__DIR__ <> "/" <> path) |> get_lines()

  defp get_lines(str), do: str |> String.trim() |> String.split(~r{\n})
end

IO.inspect(Day2.read_input("1_test.txt"))
