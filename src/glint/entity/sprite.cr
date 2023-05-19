module Glint
  module Entity
    class Sprite < VisualGameObject
      @texture : Raylib::Texture2D
      @tint : Color = Color::WHITE

      def initialize(@texture : Raylib::Texture2D)
        @extents = vec(@texture.width, @texture.height)
      end

      def initialize(filename : String)
        @texture = Preload.texture(filename)
        @extents = vec(@texture.width, @texture.height)
      end

      # Preload a texture.
      def self.preload(filename : String)
        self.new(filename)
      end

      # Draw the texture at it's natural position.
      def draw!
        draw_at!(@position)
      end

      # Draw the texture at a specific position.
      def draw_at!(position)
        Raylib.draw_texture_pro(@texture, @extents.to_rect, position.to_rect(@extents), @pivot.from(@extents).to_raylib, @rotation, @tint.to_raylib)
      end
    end
  end
end

alias Sprite = Glint::Entity::Sprite
