defmodule ExColor.Color do
  defstruct [:rgb, :hex]

  alias __MODULE__

  def get_color(<<r, g, b, a>> = color) do
    %Color{
      rgb: %{red: r, green: g, blue: b, alpha: a},
      hex: to_hex(color)
    }
  end

  def get_color(<<r, g, b>> = color) do
    %Color{
      rgb: [red: r, green: g, blue: b],
      hex: to_hex(color)
    }
  end

  def to_hex(<<r, g, b, _a>>), do: to_hex(<<r, g, b>>)

  def to_hex(<<r, g, b>>) do
    hex =
      [r, g, b]
      |> Enum.map(fn dec -> Integer.to_string(dec, 16) |> String.pad_leading(2, "0") end)
      |> Enum.join()

    "#" <> hex
  end
end
