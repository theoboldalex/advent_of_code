defmodule Day1 do
  @pre_word_to_num %{
    oneight: 18,
    twone: 21,
    threeight: 38,
    fiveight: 58,
    sevenine: 79,
    eightwo: 82,
    eighthree: 83,
    nineight: 98,
  }

  @word_to_num %{
    one: 1,
    two: 2,
    three: 3,
    four: 4,
    five: 5,
    six: 6,
    seven: 7,
    eight: 8,
    nine: 9
  }

  def part_one_answer(input_string) do
    input_string
    |> get_lines()
    |> Enum.map(fn s -> String.replace(s, ~r{[^0-9]}, "") end)
    |> get_number_from_line()
    |> accumulate_total()
  end

  def part_two_answer(input_string) do
    input_string
    |> get_lines()
    |> Enum.map(fn line -> 
      pre_pattern = Enum.join(Map.keys(@pre_word_to_num), "|")
      pattern = Enum.join(Map.keys(@word_to_num), "|")
      
      line 
      |> String.replace(~r"#{pre_pattern}", fn p -> 
        to_string(Map.get(@pre_word_to_num, String.to_atom(p)))
      end)
      |> String.replace(~r"#{pattern}", fn p -> 
        to_string(Map.get(@word_to_num, String.to_atom(p)))
      end)
    end)
    |> Enum.map(fn s -> String.replace(s, ~r{[^0-9]}, "") end)
    |> get_number_from_line()
    |> accumulate_total()
  end

  defp get_lines(str) do
    str
    |> String.trim()
    |> String.split(~r{\n})
  end

  defp get_number_from_line(line) do
    line
    |> Enum.map(fn n -> 
      String.to_integer(String.slice(n, 0..0) <> String.slice(n, -1..-1)) 
    end)
  end

  defp accumulate_total(lines) do
    lines
    |> Enum.reduce(fn (a, b) -> a + b end)
  end
end

