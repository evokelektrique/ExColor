defmodule ExColor.Pixel do
  defstruct [:x, :y, :color]

  alias __MODULE__
  alias ExColor.Color

  def get_pixels(image, x, y) do
    offset = pixel_offset(image, x, y)
    <<_::binary-size(offset), pixel::binary-size(4), _::binary>> = image.data

    %Pixel{x: x, y: y, color: Color.get_color(pixel)}
  end

  def pixel_offset(image, x, y) do
    (y * image.width + x) * 4
  end
end
