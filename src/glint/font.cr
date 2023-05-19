module Glint
  module Font
    class Font; end

    # Returns the default font.
    def self.default
      Raylib.get_font_default
    end
  end
end

alias Font = Glint::Font::Font
