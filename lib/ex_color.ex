defmodule ExColor do
  defstruct [:width, :height, :pixels]

  def extract(path) do
    {:ok, pixels} = Pixels.read_file(path)

    pixels
  end
end

defmodule ExColor.Pixel do
  defstruct [:x, :y, :color]

  alias __MODULE__
  alias ExColor.Color

  def get_pixels(image, x, y) do
    offset = pixel_offset(image, x, y)
    <<_::binary-size(offset), pixel::binary-size(4), _::binary>> = image.data

    # Color.get_color(pixel)
    %Pixel{x: x, y: y, color: Color.get_color(pixel)}
  end

  def pixel_offset(image, x, y) do
    (y * image.width + x) * 4
  end
end

defmodule ExColor.Color do
  defstruct [:red, :green, :blue, alpha: 255]

  alias __MODULE__

  def get_color(<<r, g, b, a>>), do: %Color{red: r, green: g, blue: b, alpha: a}

  def get_color(<<r, g, b>>) do
    %Color{
      rgb: [red: r, green: g, blue: b],
      hex: to_hex()
    }
  end

  # TODO:
  def to_rgb(<<r, g, b>>) do
    %{red: r, green: g, blue: blue}
  end

  def to_hex(<<r, g, b, _>>), do: to_hex(<<r, g, b>>)
end
