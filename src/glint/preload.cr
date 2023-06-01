module Glint
  # Allows for frontloading of external resources.
  module Preload
    # Loads a texture.
    def self.texture(filename)
      texture = Raylib.load_texture(filename)
      raise "Could not load texture #{filename}" unless texture
      texture
    end

    # Loads a font.
    def self.font(filename)
      Glint::Font.load(filename)
    end

    # Loads a sound effect.
    def self.sound_effect(filename); end
  end
end
