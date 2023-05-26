module Glint
  module Entity
    class Sprite < Entity
      # The sprite's texture.
      @texture : Raylib::Texture2D

      # The sprite's tint.
      property tint : Color = Color::WHITE

      def initialize(@texture : Raylib::Texture2D)
        @extents = Vector2.new(@texture.width, @texture.height)
      end

      # Creates a sprite from an external texture.
      def initialize(filename : String)
        @texture = Preload.texture(filename)
        @extents = Vector2.new(@texture.width, @texture.height)
      end

      # Preloads an external texture.
      def self.preload(filename : String)
        self.new(filename)
      end

      # Draws the texture at it's natural position.
      def draw
        draw_at(@position)
      end

      # Draws the texture at a specific position.
      def draw_at(position)
        Raylib.draw_texture_pro(@texture, @extents.to_rect, position.to_rect(@extents), @pivot.from(@extents), @rotation, @tint)
      end
    end
  end
end

# Convenience alias for `Glint::Entity::Sprite`.
alias Sprite = Glint::Entity::Sprite
