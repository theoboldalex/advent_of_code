defmodule DayFour do
  @input_path "real.txt"

  @possible_directions [
    {1, 0},
    {-1, 0},
    {0, 1},
    {0, -1},
    {1, 1},
    {1, -1},
    {-1, 1},
    {-1, -1}
  ]

  def part_one do
    count_occurrences(define_grid(read_input()))
  end

  def part_two do
    nil
  end

  def count_occurrences(grid) do
    word = "XMAS"
    chars = String.graphemes(word)

    grid
    |> Enum.with_index()
    |> Enum.flat_map(fn {row, x} ->
      row
      |> Enum.with_index()
      |> Enum.flat_map(fn {_, y} ->
        @possible_directions
        |> Enum.map(&matches_in_direction?(grid, chars, {x, y}, &1))
      end)
    end)
    |> Enum.count(& &1)
  end

  defp read_input, do: File.read!("#{__DIR__}/#{@input_path}")

  defp define_grid(contents) do
    contents
    |> String.split(~r/\n/, trim: true)
    |> Enum.map(&String.graphemes/1)
  end

  defp matches_in_direction?(
         grid,
         char_list,
         {current_x, current_y},
         {direction_x, direction_y}
       ) do
    # Copy pasta 2023 day 3
    coords =
      Enum.map(0..(Enum.count(char_list) - 1), fn i ->
        {current_x + i * direction_x, current_y + i * direction_y}
      end)

    if Enum.all?(coords, fn {cx, cy} -> check_within_grid_bounds(grid, cx, cy) end) do
      letters =
        Enum.map(coords, fn {cx, cy} ->
          Enum.at(Enum.at(grid, cx), cy)
        end)

      letters == char_list
    else
      false
    end
  end

  defp check_within_grid_bounds(grid, x, y),
    do: x >= 0 and y >= 0 and x < length(grid) and y < length(hd(grid))
end

IO.puts("part one: #{DayFour.part_one()}")
# IO.puts("part two: #{DayFour.part_two()}")
