defmodule ExColor.Color do
  defstruct [:rgb, :hex]

  alias __MODULE__

  @spec get_color(binary()) :: any()
  def get_color(<<r, g, b, a>> = color) do
    %Color{
      rgb: [r, g, b, a],
      hex: to_hex(color)
    }
  end

  @spec get_color(binary()) :: any()
  def get_color(<<r, g, b>> = color) do
    %Color{
      rgb: [r, g, b],
      hex: to_hex(color)
    }
  end

  @spec to_hex(binary()) :: String.t()
  def to_hex(<<r, g, b, _a>>), do: to_hex(<<r, g, b>>)

  @spec to_hex(binary()) :: String.t()
  def to_hex(<<r, g, b>>) do
    hex =
      [r, g, b]
      |> Enum.map(fn dec -> Integer.to_string(dec, 16) |> String.pad_leading(2, "0") end)
      |> Enum.join()

    "#" <> hex
  end
end
