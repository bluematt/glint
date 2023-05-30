module Glint
  module Shape
    class Polyline < Shape
      @points : Array(Position) = [] of Position

      # Creates a polyline.
      def initialize(@points); end

      # Add a point to the polyline.
      def <<(point : Position)
        @points << point
      end

      def self.draw(points : Array(Position), fill_color : Color? = DEFAULT_FILL_COLOR, outline : Number = 0, outline_color : Color? = DEFAULT_OUTLINE_COLOR)
      end

      def draw
        Polyline.draw(@points, @fill_color, @outline, @outline_color)
      end
    end
  end
end

# Convenience alias for `Glint::Shape::Polyline`.
alias Polyline = Glint::Shape::Polyline
