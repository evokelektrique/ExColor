defmodule ExColor do
  defstruct [:width, :height, :chunks]

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
      _length::unsigned-32,
      ?I,
      ?H,
      ?D,
      ?R,
      width::unsigned-32,
      height::unsigned-32,
      chunks::binary
    >> = binary

    %ExColor{width: width, height: height, chunks: chunks}
  end
end
