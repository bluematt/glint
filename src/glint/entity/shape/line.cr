module Glint
  module Shape
    class Line < Shape
      @end_position : Position = Vector2.new

      # Draws the line.
      def draw
        if outline_color = @outline_color
          Line.draw(@position, @end_position, @outline, outline_color)
        end
      end

      # Draw a line.
      def self.draw(start_position : Vector2, end_position : Vector2, outline : Float32 = 1, color : Color = Color::BLACK)
        Raylib.draw_line_ex(start_position, end_position, outline, color)
      end

      # :ditto:
      def self.draw(x1 : Float32, y1 : Float32, x2 : Float32, y2 : Float32, outline : Float32 = 1, color : Color = Color::BLACK)
        self.draw(Vector2.new(x1, y1), Vector2.new(x2, y2), outline, color)
      end

      # Returns the (start) position.
      #
      # Semantic alias for `Glint::Entity::Entity#position`.
      def start_position
        @position
      end

      # Sets the (start) position.
      #
      # Semantic alias for `Glint::Entity::Entity#position=`.
      def start_position=(start_position : Vector2)
        @position = start_position
      end

      # Returns the end position.
      def end_position
        @end_position
      end

      # Sets the end position.
      def end_position=(end_position : Vector2)
        @end_position = end_position
      end
    end
  end
end

# Convenience alias for `Glint::Shape::Line`.
alias Line = Glint::Shape::Line
