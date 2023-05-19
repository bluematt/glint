# glint

A simple 2d game framework for [Crystal](https://crystal-lang.org/) using [Raylib](https://www.raylib.com/).

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     glint:
       github: bluematt/glint
   ```

2. Run `shards install`

## Usage

```crystal
require "glint"

class MyGame < Game
  def initialize
    @display_fps = true
    super(800, 600, "My Awesome Game")
  end

  def draw
    Label.draw("Hello, World!")
  end
end
```

### Running and compilation

To run while developing:

```bash
$ crystal run my_game.cr
```

To compile for release:

```bash
$ crystal build my_game.cr --release --no-debug
$ ./my_game
```

### Documentation

To generate the HTML documentation for the Glint API:

```bash
$ crystal docs lib/glint/src/glint.cr
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/bluematt/glint/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [bluematt](https://github.com/your-github-user) - creator and maintainer
