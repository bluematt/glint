module Glint
  # Allows for frontloading of external resources.
  module Preload
    # Preload a texture.
    def self.texture(filename)
      texture = Raylib.load_texture(filename)
      raise "Could not load texture #{filename}" unless texture
      texture
    end
  end
end

# Convenience alias for `Glint::Preload`.
alias Preload = Glint::Preload
