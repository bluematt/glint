module Glint
  # A two dimensional vector.
  class Vector2
    property x, y = 0.0

    # Creates a new `Vector2`.
    def initialize(@x = 0.0, @y = 0.0); end

    # Converts to a Rectangle with this size.
    def to_rect
      R::Rectangle.new x: 0, y: 0, width: @x, height: @y
    end

    # Converts to a Rectangle at this position with a size.
    def to_rect(size : Vector2)
      R::Rectangle.new x: @x, y: @y, width: size.x, height: size.y
    end

    # Adds another vector.
    def +(other : Vector2)
      return vec(@x + other.x, @y + other.y)
    end

    # Multiplies the vector by a factor.
    def *(factor : Number)
      vec(@x * factor, @y * factor)
    end

    # Multiplies the vector by a factor `Vector2`.
    #
    # Each component is multiplied by its corresponding component in the *other* `Vector2`.
    def *(other : Vector2)
      vec(@x * other.x, @y * other.y)
    end

    # Divides the vector by a factor.
    def /(factor)
      vec(@x / factor, @y / factor)
    end

    # Multiplies the vector by a factor `Vector2`.
    #
    # Each component is divided by its corresponding component in the *other* `Vector2`.
    def /(other : Vector2)
      vec(@x / other.x, @y / other.y)
    end

    # Returns a Raylib compatible version of the vector.
    #
    # This method is always inlined.
    #
    # TODO Check whether inlining actually makes any difference.
    @[AlwaysInline]
    def to_raylib : R::Vector2
      R::Vector2.new x: @x, y: @y
    end

    # Returns a readable version.
    def to_s(io)
      io << "(" << @x << "," << @y << ")"
    end
  end
end

# Convenience alias for `Glint::Vector2`.
alias Vector2 = Glint::Vector2

# Returns a new `Vector2`.
def vec(x : Number, y : Number) : Vector2
  Vector2.new(x, y)
end

# Returns a new `Vector2` from a `Raylib::Vector2`.
def vec(raylib_vec : Glint::R::Vector2) : Vector2
  vec(raylib_vec.x, raylib_vec.y)
end

# Returns a new `Vector2`.
def vec : Vector2
  Vector2.new
end
