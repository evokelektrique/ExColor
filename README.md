# ExColor

Extract colors from **PNG** or **JPEG** images.

## Usage
```elixir
# Get two top colors from the image
ExColor.get_most_used_colors("./test/samples/flower.png", 2) # ["#132A00", "#FFFFFF"]
```

## TODO

- [ ] Long distance colors
- [ ] Improve performance
- [ ] Add more abilities
- [ ] Support other image formats
