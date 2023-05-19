module Glint
  # Handle preloading.
  module Preload
    # Preload an image into memory.
    def self.texture(filename)
      texture = Raylib.load_texture(filename)
      raise "Could not load texture #{filename}" unless texture
      texture
    end
  end
end
