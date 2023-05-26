module Glint
  module Shape
    class Circle < Shape
      # The minimum number of segments for drawing.
      MINIMUM_SEGMENTS = 30

      DEGREES_START = 0.degrees
      DEGREES_END = 360.degrees

      # The radius of the circle.
      @radius = 0

      # Draw the circle.
      def draw
        Circle.draw(@position, @radius, @fill_color, @outline, @outline_color, @outline_position)
      end

      # Draw a circle.
      def self.draw(x : Number, y : Number, radius : Number = 0, fill_color : Color? = DEFAULT_FILL_COLOR, outline : Number = 0, outline_color : Color? = DEFAULT_OUTLINE_COLOR, outline_position : OutlinePosition = DEFAULT_OUTLINE_POSITION)
        Circle.draw(Vector2.new(x, y), radius, fill_color, outline, outline_color, outline_position)
      end

      # Draw a circle.
      def self.draw(position : Vector2 = Vector2.new, radius : Number = 0, fill_color : Color? = DEFAULT_FILL_COLOR, outline : Number = 0, outline_color : Color? = DEFAULT_OUTLINE_COLOR, outline_position : OutlinePosition = DEFAULT_OUTLINE_POSITION)
        raise ArgumentError.new("radius <= 0") if radius <= 0 # Don't draw anything if no radius.

        if fill_color # Don't draw fill if no fill color.
          Circle.fill(position, radius, fill_color)
        end

        raise ArgumentError.new("outline < 0") if outline < 0
        return if outline == 0 # Don't draw outline if no radius.

        if outline_color # Don't draw outline if no outline color.
          Circle.outline(position, radius, outline, outline_color, outline_position)
        end
      end

      # Draw a disc (filled circle).
      def self.fill(position : Vector2, radius : Number, fill_color : Color = DEFAULT_FILL_COLOR)
        Raylib.draw_circle(position.x, position.y, radius, fill_color)
      end

      # Draw an outline (outlined circle).
      #
      # The position of the outline relative to the fill depends on the *outline_position*.
      def self.outline(position : Vector2, radius : Number, outline : Number = 1, outline_color : Color = DEFAULT_OUTLINE_COLOR, outline_position : OutlinePosition = DEFAULT_OUTLINE_POSITION)
        if outline == 1
          case outline_position
          when .inside?
            radius -= 0.5
          when .outside?
            radius += 0.5
          else
            # pass
          end
          Raylib.draw_circle_lines(position.x, position.y, radius, outline_color)
        else
          # The number of segments is proportional to the radius.  This is to ensure
          # that the circle isn't *too* jaggy.  A lower limit prevents small radii being
          # rendered as obvious polygons.
          segments = Math.min(MINIMUM_SEGMENTS, radius)
          inner = radius
          outer = radius
          case outline_position
          when .inside?
            inner = radius - outline
          when .outside?
            outer = radius + outline
          else
            d = (outline / 2)
            inner = radius - d
            outer = radius + d
          end
          Raylib.draw_ring(position, inner, outer, DEGREES_START, DEGREES_END, segments, outline_color)
        end
      end
    end
  end
end

# Convenience alias for `Glint::Shape::Circle`.
alias Circle = Glint::Shape::Circle
