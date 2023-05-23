module Glint
  module Entity
    class Sprite < Entity
      # The sprite's texture.
      @texture : R::Texture2D

      # The sprite's tint.
      property tint : Color = Color::WHITE

      def initialize(@texture : R::Texture2D)
        @extents = vec(@texture.width, @texture.height)
      end

      # Creates a sprite from an external texture.
      def initialize(filename : String)
        @texture = Preload.texture(filename)
        @extents = vec(@texture.width, @texture.height)
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
        R.draw_texture_pro(@texture, @extents.to_rect, position.to_rect(@extents), @pivot.from(@extents).to_raylib, @rotation, @tint.to_raylib)
      end
    end
  end
end

# Convenience alias for `Glint::Entity::Sprite`.
alias Sprite = Glint::Entity::Sprite
