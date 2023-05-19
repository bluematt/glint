module Glint
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

    @[AlwaysInline]
    def to_raylib_vector2
      Raylib::Vector2.new x: @x, y: @y
    end
  end
end

alias Vector2 = Glint::Vector2

# Return a new `Vector2`.
def vec(x : Number, y : Number) : Vector2
  Vector2.new(x, y)
end

# Return a new `Vector2`(0, 0).
def vec : Vector2
  Vector2.new
end
