# ExColor

Extract colors from **PNG** or **JPEG** images.

## Usage

```elixir
# Extract two most used colors from an image
path = "./test/samples/flower.png"
ExColor.get_most_used_colors(path, 2) 
# => ["#132A00", "#FFFFFF"]
```

## TODO

- [ ] Long distance colors
- [ ] Improve performance
- [ ] Add more abilities
- [ ] Support other image formats
