defmodule ExColorTest do
  use ExUnit.Case
  doctest ExColor

  test "get most used colors from PNG samples" do
    # Flower
    colors_flower = ExColor.get_most_used_colors("./test/samples/flower.png")
    assert colors_flower == ["#132A00", "#FFFFFF", "#182400", "#142B01", "#152000"]

    # Alita
    colors_alita = ExColor.get_most_used_colors("./test/samples/alita.png")
    assert colors_alita == ["#080B10", "#090C11", "#070A0F", "#090D10", "#080D11"]

    # Fireworks
    colors_fireworks = ExColor.get_most_used_colors("./test/samples/fireworks.png")
    assert colors_fireworks == ["#090816", "#0A0917", "#0A0919", "#01091C", "#0B0A18"]

    # Lasagna
    colors_lasagna = ExColor.get_most_used_colors("./test/samples/lasagna.png")
    assert colors_lasagna == ["#280000", "#260000", "#2B0000", "#080000", "#290000"]
  end
end
