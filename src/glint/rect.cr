module Glint
  # A notional rectangle in 2d space.
  class Rect
    # The position of the `Rect`.
    property position : Vector2

    # The size of the `Rect`.
    property size : Vector2

    def initialize(@position, @size); end

    def initialize(@position, width : Number, height : Number)
      @size = Vector2.new(width, height)
    end

    def initialize(x : Number, y : Number, @size)
      @position = Vector2.new(x, y)
    end

    def initialize(x : Number, y : Number, width : Number, height : Number)
      @position = Vector2.new(x, y)
      @size = Vector2.new(width, height)
    end

    # Return the x position of the `Rect`.
    def x
      @position.x
    end

    # Set the x position of the `Rect`.
    def x=(x : Number)
      @position.x = x
    end

    # Return the y position of the `Rect`.
    def y
      @position.y
    end

    # Set the y position of the `Rect`.
    def y=(y : Number)
      @position.y = y
    end

    # Return the width of the `Rect`.
    def width
      @size.x
    end

    # Set the width of the `Rect`.
    def width=(width : Number)
      @size.x = width
    end

    # Return the height of the `Rect`.
    def height
      @size.y
    end

    # Set the height of the `Rect`.
    def height=(height : Number)
      @size.y = height
    end
  end
end
