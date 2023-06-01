module Glint
  # A game object that displays some text.
  class Label < Control
    # The label's text.
    property text : String = ""

    # The label's font size.
    property font_size : Int32 = 20

    # The label's color.
    property color : Color = Color::BLACK

    # The label's font.
    property font : Glint::Font

    # The label's text spacing.
    property spacing = 1.0

    # Creates a `Label`.
    def initialize(@text = "", @position = Position.new, @color = Color::BLACK, @font_size = 20, @font = Glint::Font.new, @spacing = 1.0); end

    # Draws a `Label`.
    def self.draw(text : String = "", position : Position = Position.new, color = Color::BLACK, font_size : Int32 = 30, font : Font = Glint::Font.new, spacing : Float = 1.0, rotation : Float = 0.0, offset : Position = Position.new)
      Raylib.draw_text_pro(font, text, position, offset, rotation, font_size, spacing, color)
    end

    # Draws the `Label`.
    def draw
      Label.draw(@text, @position, @color, @font_size, @font, @spacing, @rotation, @pivot.from(self.extents))
    end

    # Returns the extents for the `Label`'s text.
    def extents
      Dimension.new(Raylib.measure_text_ex(@font, @text, @font_size, @spacing))
    end
  end
end
