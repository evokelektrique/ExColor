defmodule ExColor do
  defstruct [:length, :width, :height]

  def parse_png(binary) do
    <<
      # According to the libpng table reference: 
      # http://www.libpng.org/pub/png/book/chapter08.html#png.ch08.tbl.1
      137,
      ?P,
      ?N,
      ?G,
      13,
      10,
      26,
      10,
      length::unsigned-32,
      "IHDR",
      width::unsigned-32,
      height::unsigned-32,
      _chunk::binary
    >> = binary

    %ExColor{length: length, width: width, height: height}
  end
end
