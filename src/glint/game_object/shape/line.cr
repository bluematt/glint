module Glint
  module Shape
    class Line < Shape
      # The `Line`'s end position.
      @end_position : Position = Position.new

      # Draw a line.
      def self.draw(start_position : Position, end_position : Position, width : Float32 = 1, color : Color? = Color::BLACK)
        raise ArgumentError.new("Invalid width #{width}") if width < 0
        return if width <= 0 # Don't draw line if no width.
        return if color.nil? # Don't draw line if no color.

        Raylib.draw_line_ex(start_position, end_position, width, color)
      end

      # :ditto:
      def self.draw(x1 : Float32, y1 : Float32, x2 : Float32, y2 : Float32, width : Float32 = 1, color : Color = Color::BLACK)
        Line.draw(Position.new(x1, y1), Position.new(x2, y2), width, color)
      end

      # Draws the line.
      def draw
        Line.draw(@position, @end_position, @outline, @outline_color)
      end

      # Returns the (start) position.
      def start_position
        @position
      end

      # Sets the (start) position.
      def start_position=(start_position : Position)
        @position = start_position
      end

      # Returns the end position.
      def end_position
        @end_position
      end

      # Sets the end position.
      def end_position=(end_position : Position)
        @end_position = end_position
      end

      # Returns the color.
      def color
        @outline_color
      end

      # Sets the color.
      def color=(color : Color)
        @outline_color = color
      end

      # Returns the width.
      def width
        @outline
      end

      # Sets the width.
      def width=(width : Float32)
        @outline = width
      end
    end
  end
end
