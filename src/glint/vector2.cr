module Glint
  # A two dimensional vector.
  class Vector2
    property x, y = 0.0

    def initialize(@x = 0.0, @y = 0.0); end

    # Convert to a Rectangle with this size.
    def to_rect
      Raylib::Rectangle.new x: 0, y: 0, width: @x, height: @y
    end

    # Convert to a Rectangle at this position with a size.
    def to_rect(size : Vector2)
      Raylib::Rectangle.new x: @x, y: @y, width: size.x, height: size.y
    end

    # Multiply the vector by a factor.
    def *(factor : Number)
      vec(@x * factor, @y * factor)
    end

    # Multiply the vector by a factor `Vector2`.
    #
    # Each component is multiplied by its corresponding component in the *other* `Vector2`.
    def *(other : Vector2)
      vec(@x * other.x, @y * other.y)
    end

    # Divide the vector by a factor.
    def /(factor)
      vec(@x / factor, @y / factor)
    end

    # Multiply the vector by a factor `Vector2`.
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
    def to_raylib : Raylib::Vector2
      Raylib::Vector2.new x: @x, y: @y
    end

    # Returns a readable version.
    def to_s(io)
      io << "(" << @x << "," << @y << ")"
    end
  end
end
# Convenience alias for `Glint::Vector2`.
alias Vector2 = Glint::Vector2

# Return a new `Vector2`.
def vec(x : Number, y : Number) : Vector2
  Vector2.new(x, y)
end

# Return a new `Vector2` from a `Raylib::Vector2`.
def vec(raylib_vec : Raylib::Vector2) : Vector2
  vec(raylib_vec.x, raylib_vec.y)
end

# Return a new `Vector2`(0, 0).
def vec : Vector2
  Vector2.new
end
