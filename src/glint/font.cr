module Glint
  module Font
    class Font
      # The font resource.
      @font : Font

      # Creates a new `Font` from an external font resource.
      def initialize(filename)
        @font = Preload.font(filename)
      end
    end

    # Returns the default font.
    def self.default
      R.get_font_default
    end

    # Returns a new `Font` from the font resource.
    def self.preload(filename)
      Font.new(filename)
    end
  end
end

# Convenience alias for `Glint::Font::Font`.
alias Font = Glint::Font::Font
