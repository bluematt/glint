module Glint
  module Control
    # An entity that displays some text.
    class Label < Control
      # The default text.
      DEFAULT_TEXT = ""
      # The default font size.
      DEFAULT_FONT_SIZE = 20
      DEFAULT_COLOR     = Color::BLACK
      # DEFAULT_FONT      = Font.default
      DEFAULT_SPACING = 1

      property text : String
      property font_size : Int32 = DEFAULT_FONT_SIZE
      property color : Color = DEFAULT_COLOR
      property font : R::Font
      property spacing = DEFAULT_SPACING

      def initialize(@text = DEFAULT_TEXT, @position = DEFAULT_POSITION, @font_size = DEFAULT_FONT_SIZE, @color = DEFAULT_COLOR)
        @font = Font.default
        @spacing = DEFAULT_SPACING
      end

      # Draw the texture at it's natural position.
      def draw
        draw_at(@position)
      end

      # Draw the texture at a specific position.
      def draw_at(position)
        R.draw_text_pro(@font, @text, position, @pivot.from(get_extents), @rotation, @font_size, @spacing, @color.to_raylib)
      end

      def get_extents
        Vector2.new(R.measure_text_ex(@font, @text, @font_size, @spacing))
      end

      def self.draw(text = DEFAULT_TEXT, position = DEFAULT_POSITION, font_size = DEFAULT_FONT_SIZE, color = DEFAULT_COLOR)
        label = Label.new(text, position, font_size, color)
        label.draw
      end
    end
  end
end

# Convenience alias for `Glint::Control::Label`.
alias Label = Glint::Control::Label
