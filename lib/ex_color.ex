defmodule ExColor do
  def extract(path) do
    {:ok, pixels} = Pixels.read_file(path)

    pixels
  end
end
