defmodule ExColor do
  @moduledoc """
  TODO: Write documentation
  """

  alias ExColor.Pixel
  alias ExColor.Color

  @spec get_most_used_colors(String.t(), number) :: list(String.t())
  def get_most_used_colors(path, quantity \\ 5) do
    {:ok, pixels} = Pixels.read_file(path)

    colors =
      Enum.map(0..(pixels.width - 1), fn x ->
        Enum.map(0..(pixels.height - 1), fn y ->
          %Pixel{color: %Color{hex: hex}} = Pixel.get_pixel(pixels, x, y)
          hex
        end)
      end)

    colors
    |> List.flatten()
    |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
    |> Map.to_list()
    |> Enum.sort(fn {_k1, value_1}, {_k2, value_2} -> value_1 >= value_2 end)
    |> Enum.take(quantity)
    |> Enum.map(fn {color, _count} -> color end)
  end
end
