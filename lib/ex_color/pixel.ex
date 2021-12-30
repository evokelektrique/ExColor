defmodule ExColor.Pixel do
  defstruct [:x, :y, :color]

  alias __MODULE__
  alias ExColor.Color

  @spec get_pixel(any(), number, number) :: any()
  def get_pixel(image, x, y) do
    offset = pixel_offset(image, x, y)
    <<_::binary-size(offset), pixel::binary-size(4), _::binary>> = image.data

    %Pixel{x: x, y: y, color: Color.get_color(pixel)}
  end

  @spec pixel_offset(any(), number, number) :: number
  def pixel_offset(image, x, y) do
    (y * image.width + x) * 4
  end
end
