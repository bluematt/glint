module Glint
  class Sprite < GameObject
    # The `Sprite`'s texture.
    @texture : Texture

    # The `Sprite`'s tint.
    property tint : Color = Color::WHITE

    # Creates a `Sprite` from a `Raylib::Texture2D`.
    def initialize(texture : Raylib::Texture2D)
      @texture = Texture.new(texture)
    end

    # Creates a `Sprite` from an external `Texture`.
    def initialize(filename : String)
      @texture = Texture.new(filename)
    end

    # Draws the `Sprite`'s texture.
    def draw
      @texture.draw(@position, @pivot, @rotation, @tint)
      # Raylib.draw_texture_pro(@texture, @extents.to_rect, @position.to_rect(@extents), @pivot.from(@extents), @rotation, @tint)
    end
  end
end
