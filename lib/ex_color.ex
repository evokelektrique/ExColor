defmodule ExColor do
  @moduledoc """
  TODO: Write documentation
  """

  use Bitwise
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

  #
  # Distance between two RGB colors
  #
  # Example:
  #   iex> ExColor.color_distance({0, 0, 0}, {1, 1, 0})
  #   2.449489742783178
  #
  def color_distance({r1, g1, b1} = _color_1, {r2, g2, b2} = _color_2) do
    rmean = trunc((r1 + r2) / 2)
    r = r1 - r2
    g = g1 - g2
    b = b1 - b2
    :math.sqrt((((512 + rmean) * r * r) >>> 8) + 4 * g * g + (((767 - rmean) * b * b) >>> 8))
  end
end
