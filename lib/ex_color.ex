defmodule ExColor do
  defstruct [:width, :height, :bit_depth, :color_type, :compression, :filter, :interlace, :chunks]

  def read(path) do
    path
    |> File.read!()
    |> parse_png()
  end

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
      bit_depth,
      color_type,
      compression_method,
      filter_method,
      interlace_method,
      _crc::unsigned-32,
      chunks::binary
    >> = binary

    png = %ExColor{
      width: width,
      height: height,
      bit_depth: bit_depth,
      color_type: color_type,
      compression: compression_method,
      filter: filter_method,
      interlace: interlace_method,
      chunks: []
    }

    parse_png_chunks(chunks, png)
  end

  defp parse_png_chunks(
         <<
           length::unsigned-32,
           chunk_type::unsigned-32,
           chunk_data::binary-size(length),
           crc::unsigned-32,
           chunks::binary
         >>,
         png
       ) do
    chunk = %{
      length: length,
      chunk_type: :binary.encode_unsigned(chunk_type),
      data: chunk_data,
      crc: crc
    }

    png = %{png | chunks: [chunk | png.chunks]}

    parse_png_chunks(chunks, png)
  end

  defp parse_png_chunks(<<>>, png) do
    %{png | chunks: Enum.reverse(png.chunks)}
  end
end
