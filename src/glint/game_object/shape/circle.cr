module Glint
  module Shape
    # A simple circle shape.
    class Circle < Shape
      # The minimum number of segments for drawing.
      private MINIMUM_SEGMENTS = 30

      # The angle at which to start drawing outlines.
      private DEGREES_START = 0.degrees

      # The angle at which to end drawing outlines.
      private DEGREES_END = 360.degrees

      # The radius of the circle.
      @radius = 0

      # Draw a circle.
      def self.draw(position : Vector2 = Vector2.new, radius : Number = 0, fill_color : Color? = nil, outline : Number = 0, outline_color : Color? = nil, outline_position : OutlinePosition = DEFAULT_OUTLINE_POSITION)
        raise ArgumentError.new("Invalid radius #{radius}") if radius < 0
        return if radius <= 0 # Don't draw anything if no radius.

        # Draw fill only if there's an fill color.
        Circle.fill(position, radius, fill_color) if fill_color

        raise ArgumentError.new("Invalid outline #{outline}") if outline < 0
        return if outline <= 0 # Don't draw outline if no outline.

        # Draw outline only if there's an outline color.
        Circle.outline(position, radius, outline, outline_color, outline_position) if outline_color
      end

      # Draw a circle at x/y coordinates.
      def self.draw(x : Number, y : Number, radius : Number = 0, fill_color : Color? = nil, outline : Number = 0, outline_color : Color? = nil, outline_position : OutlinePosition = DEFAULT_OUTLINE_POSITION)
        Circle.draw(Vector2.new(x, y), radius, fill_color, outline, outline_color, outline_position)
      end

      # Draw a filled circle.
      def self.fill(position : Vector2, radius : Number, fill_color : Color)
        Raylib.draw_circle(position.x, position.y, radius, fill_color)
      end

      # Draw an circle outline.
      def self.outline(position : Vector2, radius : Number, outline : Number = 1, outline_color : Color = nil, outline_position : OutlinePosition = DEFAULT_OUTLINE_POSITION)
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

      # Draw the circle.
      def draw
        Circle.draw(@position, @radius, @fill_color, @outline, @outline_color, @outline_position)
      end
    end
  end
end
