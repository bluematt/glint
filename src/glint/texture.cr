module Glint
  struct Texture
    # The texture resource.
    @texture : Raylib::Texture2D

    # Creates a texture from a `Raylib::Texture2D`.
    def initialize(@texture : Raylib::Texture2D); end

    # Creates a texture from an external resource.
    def initialize(filename : String)
      @texture = Texture.load(filename)
    end

    # Loads an external texture resource.
    def self.load(filename : String)
      Raylib.load_texture(filename)
    end

    # Returns the `Texture`'s extents.
    def extents
      Dimension.new(@texture.width, @texture.height)
    end

    # Draw a texture
    def draw(position, pivot, rotation, tint)
      Raylib.draw_texture_pro(@texture, self.extents.to_rect, position.to_rect(self.extents), pivot.from(self.extents), rotation, tint)
    end

    # Returns the `Texture` in a C-compatible format, i.e. as `Raylib::Texture`.
    #
    # This allows for transparent interoperability with the Raylib library.
    def to_unsafe
      @texture
    end
  end
end
