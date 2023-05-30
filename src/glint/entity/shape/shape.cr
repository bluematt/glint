module Glint
  module Shape
    # The default fill color.
    DEFAULT_FILL_COLOR = Color::RED

    # The default outline color.
    DEFAULT_OUTLINE_COLOR = Color::GREEN

    # The default outline position.
    DEFAULT_OUTLINE_POSITION = OutlinePosition::Centered

    # Where a `Shape`'s outline is positioned relative to the fill area.
    enum OutlinePosition
      # Overlaps the edge of the fill.
      Centered
      # Inside the edge of the fill.
      Inside
      # Outside the edge of the fill.
      Outside
    end

    # A `Shape` is a generic shape game object that can be drawn.
    abstract class Shape < GameObject
      # The shape's fill color.
      @fill_color : Color?
      # The shape's outline color.
      @outline_color : Color?
      # The thickness of any outline.
      @outline : Float32 = 0
      # The position of the outline.
      @outline_position : OutlinePosition = OutlinePosition::Centered

      # Returns the fill color.
      def fill_color
        @fill_color
      end

      # Sets the fill color.
      def fill_color=(color : Color)
        @fill_color = color
      end

      # Returns the outline color.
      def outline_color
        @outline_color
      end

      # Sets the outline color.
      def outline_color=(color : Color)
        @outline_color = color
      end

      # Returns the outline width.
      def outline
        @outline
      end

      # Sets the outline width.
      def outline=(width : Number)
        @outline = width
      end

      # Returns the outline position.
      def outline_position
        @outline_position
      end

      # Sets the outline position.
      def outline_position=(position : OutlinePosition)
        @outline_position = position
      end
    end
  end
end

require "./circle.cr"
require "./line.cr"
require "./polyline.cr"
require "./polygon.cr"
require "./rectangle.cr"

# Convenience alias for `Glint::Shape::OutlinePosition`.
alias OutlinePosition = Glint::Shape::OutlinePosition
