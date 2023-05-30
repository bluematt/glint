module Glint
  module Shape
    class Rectangle < Shape
      # The size of the `Rectangle`.
      property size : Dimension = Dimension.new

      # Draw a `Rectangle`.
      def self.draw(position : Position, size : Dimension, fill_color : Color? = nil, outline : Float32 = 0, outline_color : Color? = nil, outline_position = OutlinePosition::Centered)
        raise ArgumentError.new("Invalid size #{size}") if size.is_invalid_dimension?

        # Don't draw fill if no fill color.
        Rectangle.fill(position, size, fill_color) if fill_color

        raise ArgumentError.new("Invalid outline #{outline}") if outline < 0
        return if outline <= 0 # Don't draw outline if no outline.

        # Don't draw outline if no outline color.
        Rectangle.outline(position, size, outline, outline_color, outline_position) if outline_color
      end

      # Draw a `Rectangle` with a width/height.
      def self.draw(position : Position, width : Number, height : Number, fill_color : Color? = DEFAULT_FILL_COLOR, outline : Float32 = 0, outline_color : Color? = DEFAULT_OUTLINE_COLOR, outline_position = OutlinePosition::Centered)
        Rectangle.draw(position.x, position.y, width, height, fill_color, outline, outline_color, outline_position)
      end

      # Draw a `Rectangle` at x/y coordinates.
      def self.draw(x : Number, y : Number, size : Dimension, fill_color : Color? = DEFAULT_FILL_COLOR, outline : Float32 = 0, outline_color : Color? = DEFAULT_OUTLINE_COLOR, outline_position = OutlinePosition::Centered)
        Rectangle.draw(x, y, size.x, size.y, fill_color, outline, outline_color, outline_position)
      end

      # Draw a `Rectangle` at x/y coordinates with a width/height.
      def self.draw(x : Number, y : Number, width : Number, height : Number, fill_color : Color? = DEFAULT_FILL_COLOR, outline : Float32 = 0, outline_color : Color? = DEFAULT_OUTLINE_COLOR, outline_position = OutlinePosition::Centered)
        Rectangle.draw(Position.new(x, y), Dimension.new(x, y), fill_color, outline, outline_color, outline_position)
      end

      # Draw a `Rectangle` at a `Rect`.
      def self.draw(rect : Rect, fill_color : Color? = DEFAULT_FILL_COLOR, outline : Float32 = 0, outline_color : Color? = DEFAULT_OUTLINE_COLOR, outline_position = OutlinePosition::Centered)
        Rectangle.draw(rect.position, rect.size, fill_color, outline, outline_color, outline_position)
      end

      # Draw a filled rectangle.
      def self.fill(position : Position, size : Dimension, fill_color : Color? = DEFAULT_FILL_COLOR)
        Raylib.draw_rectangle(position.x, position.y, size.x, size.y, fill_color)
      end

      # Draw an outlined rectangle.
      def self.outline(position : Position, size : Dimension, outline : Float32 = 0, outline_color : Color? = DEFAULT_OUTLINE_COLOR, outline_position = OutlinePosition::Centered)
        raise ArgumentError.new("Invalid outline #{outline}") if outline < 0
        return if outline <= 0 # Don't draw outline if no outline.

        return if outline_color.nil?

        rect = Rect.new(position, size)
        # TODO Adjust the size of the outline rectangles.
        case outline_position
        when .centered?
          # rect.shift!(-outline/2)
          # rect.expand!(outline)
        when .outside?
          # rect.shift!(-outline)
          # rect.expand!(outline * 2)
        else
          # pass
        end
        Raylib.draw_rectangle_lines_ex(rect, outline, outline_color)
      end

      # Draw the `Rectangle`.
      def draw
        Rectangle.draw(@position, @size, @fill_color, @outline, @outline_color, @outline_position)
      end
    end
  end
end

# Convenience alias for `Glint::Shape::Rectangle`.
alias Rectangle = Glint::Shape::Rectangle
