defmodule DayOne do
  @input_path "real.txt"

  def get_left do
    File.stream!("#{__DIR__}/#{@input_path}")
    |> Enum.map(fn l ->
      l
      |> String.trim()
      |> String.split(~r/\s+/, parts: 2)
      |> hd()
      |> String.to_integer()
    end)
    |> Enum.sort()
  end

  def get_right do
    File.stream!("#{__DIR__}/#{@input_path}")
    |> Enum.map(fn l ->
      l
      |> String.trim()
      |> String.split(~r/\s+/, parts: 2)
      |> case do
        [_head, tail] -> String.to_integer(tail)
        [_head] -> ""
      end
    end)
    |> Enum.sort()
  end

  def zip_sides do
    Enum.zip(get_left(), get_right())
  end

  def result do
    zip_sides()
    |> Enum.map(fn {l, r} -> abs(l - r) end)
    |> Enum.reduce(&(&1 + &2))
  end
end

DayOne.result()
|> IO.inspect()
