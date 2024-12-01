defmodule DayOne do
  @input_path "real.txt"

  def stream_file do
    File.stream!("#{__DIR__}/#{@input_path}")
  end

  def get_line_parts(line) do
    line
    |> String.trim()
    |> String.split(~r/\s+/, parts: 2)
  end

  def get_left do
    stream_file()
    |> Enum.map(&get_line_parts/1)
    |> Enum.map(&String.to_integer(hd(&1)))
  end

  def get_right do
    stream_file()
    |> Enum.map(&get_line_parts/1)
    |> Enum.map(fn l ->
      case l do
        [_, tail] -> String.to_integer(tail)
        [_] -> ""
      end
    end)
  end

  def result do
    Enum.zip(Enum.sort(get_left()), Enum.sort(get_right()))
    |> Enum.map(fn {l, r} -> abs(l - r) end)
    |> Enum.reduce(&(&1 + &2))
  end
end

DayOne.result()
|> IO.inspect()
