defmodule Day3 do
  defp read_input(path), do: File.read!("#{__DIR__}/#{path}") |> get_lines()

  defp get_lines(str), do: str |> String.trim() |> String.split(~r{\n})
end
