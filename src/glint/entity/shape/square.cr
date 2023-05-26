module Glint
  module Shape
    class Square < Rectangle
      # The length of the side of the `Square`.
      @side : Float32 = 0

      # Returns the side length of the `Square`.
      def side
        return self.width
      end

      # Sets the side length of the `Square`.
      def side=(length : Number)
        self.width = self.height = length
      end

      # Sets the width (and height) of the `Square`.
      def width=(width : Number)
        self.side = width
      end

      # Sets the height (and width) of the `Square`.
      def height=(height : Number)
        self.side = height
      end
    end
  end
end

# Convenience alias for `Glint::Shape::Square`.
alias Square = Glint::Shape::Square
