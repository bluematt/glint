module Glint
  class Font
    # The font resource.
    @font : Raylib::Font

    # Creates a new `Font` with the default font.
    def initialize
      @font = Font.default
    end

    # Creates a new `Font` from an external font resource.
    def initialize(filename)
      @font = Font.load(filename)
    end

    # Returns the default font.
    def self.default
      Raylib.get_font_default
    end

    # Returns a new `Font` from the font resource.
    def self.load(filename)
      Raylib.load_font(filename)
    end

    def to_unsafe
      @font
    end
  end
end
