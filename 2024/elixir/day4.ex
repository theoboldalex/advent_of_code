defmodule DayFour do
  @input_path "test.txt"

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
    count_occurrences(define_grid(read_input()), "XMAS")
  end

  def part_two do
    grid =
      read_input()
      |> define_grid()

    line_length = Enum.count(List.first(grid))

    grid
    |> List.flatten()
    |> Enum.with_index()
    |> Enum.reduce(0, fn
      {"A", i}, acc ->
        row = div(i, line_length)
        col = rem(i, line_length)

        if x_marks_the_spot(grid, row, col) do
          acc + 1
        else
          acc
        end

      {_, _}, acc ->
        acc
    end)
  end

  defp x_marks_the_spot(grid, row, col) do
    left_to_right?(grid, row, col) and right_to_left?(grid, row, col)
  end

  defp count_occurrences(grid, word) do
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

    if Enum.all?(coords, fn {cx, cy} -> within_grid_bounds?(grid, cx, cy) end) do
      letters =
        Enum.map(coords, fn {cx, cy} ->
          Enum.at(Enum.at(grid, cx), cy)
        end)

      letters == char_list
    else
      false
    end
  end

  defp within_grid_bounds?(grid, x, y),
    do: x >= 0 and y >= 0 and x < length(grid) and y < length(hd(grid))

  defp left_to_right?(grid, row, col) do
    left =
      if row - 1 >= 0 do
        grid |> Enum.at(row - 1, []) |> Enum.at(col - 1)
      else
        nil
      end

    right = grid |> Enum.at(row + 1, []) |> Enum.at(col + 1)

    (left == "M" and right == "S") or
      (left == "S" and right == "M")
  end

  defp right_to_left?(grid, row, col) do
    right =
      if row - 1 >= 0 do
        grid |> Enum.at(row - 1, []) |> Enum.at(col + 1)
      else
        nil
      end

    left =
      if col - 1 >= 0 do
        grid |> Enum.at(row + 1, []) |> Enum.at(col - 1)
      else
        nil
      end

    (right == "M" and left == "S") or
      (right == "S" and left == "M")
  end
end

IO.puts("part one: #{DayFour.part_one()}")
IO.puts("part two: #{DayFour.part_two()}")
