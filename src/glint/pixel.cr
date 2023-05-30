module Glint
  class Pixel < GameObject
    # Draws a colored pixel.
    def self.plot(position : Vector2, color : Color)
      Raylib.draw_pixel_v(position, color)
    end

    # Draws a colored pixel.
    def self.plot(x : Number, y : Number, color : Color)
      Raylib.draw_pixel(x, y, color)
    end
  end
end
