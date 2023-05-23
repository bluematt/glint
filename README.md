# glint

A simple 2d game framework for [Crystal](https://crystal-lang.org/) using [Raylib](https://www.raylib.com/).

Glint was inspired by a number of game engines and libraries, including but not limited to Löve2D, Godot, Dragonruby GTK, microStudio and Solar2D.  It doesn't try to replicate any of them, but it does try to take from them core ideas that make games programming actually fun.

Glint aims to make the necessary parts easy, and make the awesome parts possible.

## Prerequisites

Raylib should already be installed.  If not, you can install it with [Homebrew](https://brew.sh/).

```bash
$ brew install raylib
```

## Installation

1. Create a new Crystal app:

    ```bash
    $ crystal init app my_app
    $ cd my_app
    ```

2. Add the Glint dependency to your `shard.yml`:

   ```yaml
   dependencies:
     glint:
       github: bluematt/glint
   ```

3. Install the shards:

    ```bash
    $ shards install
    ```

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

### Running tests

TODO: Write tests.

## Development

Glint is under active development.

## Contributing

1. Fork it (<https://github.com/bluematt/glint/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [bluematt](https://github.com/your-github-user) - creator and maintainer
