module Glint
  # A notional rectangle in 2d space with x and y coordinates and a width and a height.
  struct Rect
    @r : Raylib::Rectangle

    # Creates a `Rect` from a `Raylib::Rectangle`.
    def initialize(r : Raylib::Rectangle)
      @r = r
    end

    # Creates a `Rect` from another `Rect`.
    def initialize(r : Rect)
      @r = Raylib::Rectangle.new x: r.x, y: r.y, width: r.width, height: r.height
    end

    # Creates a `Rect` from a position and a size.
    def initialize(position : Position, size : Dimension)
      @r = Raylib::Rectangle.new x: position.x, y: position.y, width: size.width, height: size.height
    end

    # Creates a `Rect` from a position, a width and a height.
    def initialize(position : Position, width : Number, height : Number)
      @r = Raylib::Rectangle.new x: position.x, y: position.y, width: width, height: height
    end

    # Creates a `Rect` from x and y coordinates and a size.
    def initialize(x : Number, y : Number, size : Dimension)
      @r = Raylib::Rectangle.new x: x, y: y, width: size.width, height: size.height
    end

    # Creates a `Rect` from x and y coordinates and a width and a height.
    def initialize(x : Number, y : Number, width : Number, height : Number)
      @r = Raylib::Rectangle.new x: x, y: y, width: width, height: height
    end

    # Return the x position of the `Rect`.
    def x
      @r.x
    end

    # Set the x position of the `Rect`.
    def x=(x : Number)
      @r.x = x
    end

    # Return the y position of the `Rect`.
    def y
      @r.y
    end

    # Set the y position of the `Rect`.
    def y=(y : Number)
      @r.y = y
    end

    # Return the width of the `Rect`.
    def width
      @r.width
    end

    # Set the width of the `Rect`.
    def width=(width : Number)
      @r.width = width
    end

    # Return the height of the `Rect`.
    def height
      @r.height
    end

    # Set the height of the `Rect`.
    def height=(height : Number)
      @r.height = height
    end

    # Returns the position of the `Rect`.
    def position
      Position.new(@r.x, @r.y)
    end

    # Sets the position of the `Rect`.
    def position=(position : Position)
      @r.x = position.x
      @r.y = position.y
    end

    # Returns the size of the `Rect`.
    def size
      Dimension.new(@r.width, @r.height)
    end

    # Sets the size of the `Rect`.
    def size=(size : Dimension)
      @r.width = size.width
      @r.width = size.width
    end

    # Returns a `Rect` expanded by an amount.
    def expand(amount : Number)
      Rect.new(self).expand!(amount)
    end

    # Expands the `Rect` by an amount.
    #
    # The expansion occurs at all four corners.
    def expand!(amount : Number)
      @r.x -= amount
      @r.y -= amount
      @r.width += amount
      @r.height += amount
    end

    # Returns a `Rect` contracted by an amount.
    def contract(amount : Number)
      Rect.new(self).contract!(amount)
    end

    # Contracts the `Rect` by an amount.
    #
    # The contraction occurs at all four corners.
    def contract!(amount : Number)
      @r.x += amount
      @r.y += amount
      @r.width -= amount
      @r.height -= amount
    end

    # Shift the position of the `Rect` by an amount in a `Vector2`.
    def shift!(v : Vector2)
      self.position += v
    end

    # Grow the size of the `Rect` by an amount in a `Vector2`.
    def grow!(v : Vector2)
      self.size += v
    end

    # Shrinks the size of the `Rect` by an amount in a `Vector2`.
    def shrink!(v : Vector2)
      self.size -= v
    end

    # Returns the rect in a C-compatible format, i.e. as `Raylib::Rectangle`.
    #
    # This allows for transparent interoperability with the Raylib library.
    def to_unsafe
      @r
    end

    # Returns the rect's values as a `Hash`.
    def to_hash
      {
        :x      => @r.x,
        :y      => @r.y,
        :width  => @r.width,
        :height => @r.height,
      }
    end

    # Returns the rect's values as a `Tuple`.
    def to_tuple
      {
        @r.x,
        @r.y,
        @r.width,
        @r.height,
      }
    end

    # :ditto:
    def values
      to_tuple
    end

    # Returns a `Hash` of the `position` and `size` vectors.
    def to_vectors_hash
      {
        :position => position,
        :size     => size,
      }
    end

    # Returns a `Tuple` of the `position` and `size` vectors.
    def to_vectors_tuple
      {
        position,
        size,
      }
    end

    forward_missing_to(@r)

    # Takes a block and adjusts the `Rect` in the way(s) defined by the block.
    def adjust(&block)
      @r = yield self
      self
    end
  end
end

# Creates a `Rect` from a `Raylib::Rectangle`.
def rect(r : Raylib::Rectangle)
  Rect.new(r)
end

# Creates a `Rect` from another `Rect`.
#
# ```
# # Example
# my_rect = rect(250, 350, Dimension.new(100, 200))
# other_rect = rect(my_rect)
# ```
def rect(r : Rect)
  Rect.new(r)
end

# Creates a `Rect` from x and y coordinates and a width and a height.
#
# ```
# # Example
# my_rect = rect(250, 350, Dimension.new(100, 200))
# ```
def rect(x : Number = 0, y : Number = 0, width : Number = 0, height : Number = 0)
  Rect.new(x, y, width, height)
end

# Creates a `Rect` from a position and a size.
#
# ```
# # Example
# my_rect = rect(Position.new(250, 350), Dimension.new(100, 200))
# ```
def rect(position : Position = Position.new(0, 0), size : Dimension = Dimension.new(0, 0))
  Rect.new(position, size)
end

# Creates a `Rect` from x and y coordinates and a size.
#
# ```
# # Example
# my_rect = rect(250, 350, Dimension.new(100, 200))
# ```
def rect(x : Number = 0, y : Number = 0, size : Dimension = Dimension.new(0, 0))
  Rect.new(x, y, size)
end

# Creates a `Rect` from a position, a width and a height.
#
# ```
# # Example
# my_rect = rect(Position.new(250, 350), 100, 200)
# ```
def rect(position : Position = Position.new(0, 0), width : Number = 0, height : Number = 0)
  Rect.new(position, width, height)
end

# Convenience alias for `Glint::Rect`.
alias Rect = Glint::Rect
