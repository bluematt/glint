module Glint
  module Control
    class Label < Control
      DEFAULT_TEXT = ""
      DEFAULT_FONT_SIZE = 20
      DEFAULT_POSITION = vec()
      DEFAULT_COLOR = Color::BLACK
      DEFAULT_FONT = Font.default
      DEFAULT_SPACING = 1

      property text : String
      property font_size : Int32 = DEFAULT_FONT_SIZE
      property color : Color = DEFAULT_COLOR
      property font : Raylib::Font = DEFAULT_FONT
      property spacing = DEFAULT_SPACING

      def initialize(@text = DEFAULT_TEXT, @position = DEFAULT_POSITION, @font_size = DEFAULT_FONT_SIZE, @color = DEFAULT_COLOR); end

      # Draw the texture at it's natural position.
      def draw
        draw_at(@position)
      end

      # Draw the texture at a specific position.
      def draw_at(position)
        Raylib.draw_text_pro(@font, @text, position.to_raylib, @pivot.from(extents).to_raylib, @rotation, @font_size, @spacing, @color.to_raylib)
      end

      def extents()
        vec(Raylib.measure_text_ex(@font, @text, @font_size, @spacing))
      end

      def self.draw(text=DEFAULT_TEXT, position=DEFAULT_POSITION, font_size=DEFAULT_FONT_SIZE, color=DEFAULT_COLOR)
        label = Label.new(text, position, font_size, color)
        label.draw()
      end
    end
  end
end

alias Label = Glint::Control::Label
