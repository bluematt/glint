module Glint
  module Control
    # A game object that displays some text.
    class Label < Control
      # The default text.
      DEFAULT_TEXT = ""

      # The default font size.
      DEFAULT_FONT_SIZE = 20

      # The default text color.
      DEFAULT_COLOR = Color::BLACK

      # The default text spacing.
      DEFAULT_SPACING = 1

      # The label's text.
      property text : String

      # The label's font size.
      property font_size : Int32 = DEFAULT_FONT_SIZE

      # The label's color.
      property color : Color = DEFAULT_COLOR

      # The label's font.
      property font : Raylib::Font

      # The label's text spacing.
      property spacing = DEFAULT_SPACING

      # Creates a `Label`.
      def initialize(@text = DEFAULT_TEXT, @position = DEFAULT_POSITION, @font_size = DEFAULT_FONT_SIZE, @color = DEFAULT_COLOR)
        @font = Font.default
        @spacing = DEFAULT_SPACING
      end

      # Draw the `Label`.
      def draw
        draw_at(@position)
      end

      # Draw the `Label` at a specific position.
      def draw_at(position : Position)
        Raylib.draw_text_pro(@font, @text, position, @pivot.from(get_extents), @rotation, @font_size, @spacing, @color)
      end

      # Returns the extents for the `Label`'s text.
      def get_extents
        Dimension.new(Raylib.measure_text_ex(@font, @text, @font_size, @spacing))
      end

      # Draws a `Label`.
      def self.draw(text = DEFAULT_TEXT, position = DEFAULT_POSITION, font_size = DEFAULT_FONT_SIZE, color = DEFAULT_COLOR)
        label = Label.new(text, position, font_size, color)
        label.draw
      end
    end
  end
end

# Convenience alias for `Glint::Control::Label`.
alias Label = Glint::Control::Label
