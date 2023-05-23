# module Glint
#   # A two dimensional vector.
#   class Vector2
#     property x, y = 0.0

#     # Creates a new `Vector2`.
#     def initialize(@x = 0.0, @y = 0.0); end

#     # Converts to a Rectangle with this size.
#     def to_rect
#       R::Rectangle.new x: 0, y: 0, width: @x, height: @y
#     end

#     # Converts to a Rectangle at this position with a size.
#     def to_rect(size : Vector2)
#       R::Rectangle.new x: @x, y: @y, width: size.x, height: size.y
#     end

#     # Adds another vector.
#     def +(other : Vector2)
#       return vec(@x + other.x, @y + other.y)
#     end

#     # Multiplies the vector by a factor.
#     def *(factor : Number)
#       vec(@x * factor, @y * factor)
#     end

#     # Multiplies the vector by a factor `Vector2`.
#     #
#     # Each component is multiplied by its corresponding component in the *other* `Vector2`.
#     def *(other : Vector2)
#       vec(@x * other.x, @y * other.y)
#     end

#     # Divides the vector by a factor.
#     def /(factor)
#       vec(@x / factor, @y / factor)
#     end

#     # Multiplies the vector by a factor `Vector2`.
#     #
#     # Each component is divided by its corresponding component in the *other* `Vector2`.
#     def /(other : Vector2)
#       vec(@x / other.x, @y / other.y)
#     end

#     # Returns a Raylib compatible version of the vector.
#     #
#     # This method is always inlined.
#     #
#     # TODO Check whether inlining actually makes any difference.
#     @[AlwaysInline]
#     def to_raylib : R::Vector2
#       R::Vector2.new x: @x, y: @y
#     end

#     # Returns a readable version.
#     def to_s(io)
#       io << "(" << @x << "," << @y << ")"
#     end
#   end
# end

# # Convenience alias for `Glint::Vector2`.
# alias Vector2 = Glint::Vector2

# # Returns a new `Vector2`.
# def vec(x : Number, y : Number) : Vector2
#   Vector2.new(x, y)
# end

# # Returns a new `Vector2` from a `Raylib::Vector2`.
# def vec(raylib_vec : Glint::R::Vector2) : Vector2
#   vec(raylib_vec.x, raylib_vec.y)
# end

# # Returns a new `Vector2`.
# def vec : Vector2
#   Vector2.new
# end

struct Raylib::Vector2
  # A lot of this is replicated from: https://github.com/unn4m3d/crystaledge/blob/master/src/crystaledge/vector2.cr

  # Converts vector to a tuple of values.
  def values
    {@x, @y}
  end

  # Creates a new vector.
  def initialize(@x = 0.0, @y = 0.0); end

  # Zero vector
  def self.zero
    Raylib::Vector2.new
  end

  def self.unit
    Raylib::Vector2.new(1, 1)
  end

  # Fills current vector with zero.
  def zero!
    @x = @y = 0
    self
  end

  # Performs component value addition.
  def +(value : Float64)
    Raylib::Vector2.new(@x + value, @y + value)
  end

  # Performs component vector addition.
  def +(other)
    Raylib::Vector2.new(@x + other.x, @y + other.y)
  end

  # Returns a negated vector.
  def -
    Raylib::Vector2.new(-@x, -@y)
  end

  # Performs component value subtraction.
  def -(value : Float64)
    Raylib::Vector2.new(@x - value, @y - value)
  end

  # Performs component vector subtraction.
  def -(other : Raylib::Vector2)
    Raylib::Vector2.new(@x - other.x, @y - other.y)
  end

  # Performs component multiplication (for dot product see `#dot`).
  def *(other : Raylib::Vector2)
    Raylib::Vector2.new(@x * other.x, @y * other.y)
  end

  # Performs factor multiplication.
  def *(factor : Float64)
    Raylib::Vector2.new(@x * factor, @y * factor)
  end

  # Performs component division.
  def /(other : Raylib::Vector2)
    Vector2.new(@x / other.x, @y / other.y)
  end

  # Performs value division.
  def /(value : Float64)
    # Multiply by the inverse => only do 1 division instead of 3
    self * (1.0 / value)
  end

  # Returns dot product of two vectors.
  def dot(other : Raylib::Vector2)
    @x * other.x + @y * other.y
  end

  # Alias for `#dot` product.
  def **(other : Raylib::Vector2)
    dot(other)
  end

  # Returns cross product of two vectors.
  def cross(other : Raylib::Vector2)
    Raylib::Vector2.new(@x*other.y - @y*other.x, @y*other.x - @x*other.y)
  end

  # Alias for `#cross` product.
  def %(other : Raylib::Vector2)
    cross(other)
  end

  # Returns magnitude.
  def magnitude
    Math.sqrt(@x ** 2 + @y ** 2)
  end

  # Alias for `#magnitude`.
  def length
    magnitude
  end

  # Returns angle between two vectors.
  def angle(other : Raylib::Vector2)
    self ** other / (magnitude * other.magnitude)
  end

  # Returns direction of a vector.
  def angle
    Math.atan2(@y, @x)
  end

  # :ditto:
  def heading
    angle
  end

  # Clones this vector and passes it into a block if given.
  def clone
    Vector2.new(@x, @y)
  end

  # :ditto:
  def clone(&b)
    c = clone
    b.call c
    c
  end

  # Normalizes current vector.
  def normalize!
    m = magnitude
    unless m == 0
      inverse = 1.0 / m
      @x *= inverse
      @y *= inverse
    end
    self
  end

  # Non-aggressive version of `#normalize!`.
  def normalize
    clone.normalize!
  end

  # Finds normal axis between two vectors
  def find_normal_axis(other : Raylib::Vector2)
    (self % other).normalize
  end

  # Finds distance between two vectors
  def distance(other : Raylib::Vector2)
    (self - other).magnitude
  end

  # Returns whether two vectors are equal.
  def ==(other : Raylib::Vector2)
    @x == other.x && @y == other.y
  end

  # Returns whether two vectors are not equal.
  def !=(other : Vector2)
    @x != other.x || @y != other.y
  end

  # Formats vector to a `String`.
  def to_s(io : IO)
    io << "(" << @x << ", " << @y << ")"
  end

  # Rotates a vector by *angle* (in radians).
  def rotate(angle : Float64)
    Raylib::Vector2.new(@x * Math.cos(angle) - @y * Math.sin(angle), @x * Math.sin(angle) + @y * Math.cos(angle))
  end
end

alias Vector2 = Raylib::Vector2
