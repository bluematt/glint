module Glint
  # A pixel.
  class Pixel < GameObject
    # The `Pixel`'s color.
    property color : Color

    # Creates a `Pixel`.
    def initialize(@position : Position, @color : Color); end

    # Draws the `Pixel`.
    def draw
      Pixel.draw(@position, @color)
    end

    # Draws a `Pixel`.
    def self.draw(position : Position, color : Color)
      Raylib.draw_pixel_v(position, color)
    end

    # Draws a `Pixel`.
    def self.draw(x : Number, y : Number, color : Color)
      Raylib.draw_pixel(x, y, color)
    end
  end
end
