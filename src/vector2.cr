struct Raylib::Vector2
  # A lot of this is replicated from: https://github.com/unn4m3d/crystaledge/blob/master/src/crystaledge/vector2.cr

  # Converts vector to a tuple of values.
  def values
    {@x, @y}
  end

  # Creates a new vector.
  def initialize(@x = 0.0, @y = 0.0); end

  # def initialize(@x : Float64 | Float32 | Int32 = 0.0, @y : Float64 | Float32 | Int32 = 0.0); end

  # Creates a new vector from another vector.
  # TODO Do we need this?  Can't we just consume vectors as-is?
  def initialize(v : Raylib::Vector2)
    @x = v.x
    @y = v.y
  end

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

  # Rotates a vector by *angle* (in degrees).
  def rotate_degrees(angle : Float64)
    rotate(angle.radians)
  end

  def to_rect
    Raylib::Rectangle.new x: 0, y: 0, width: @x, height: @y
  end

  def to_rect(size : Raylib::Vector2)
    Raylib::Rectangle.new x: @x, y: @y, width: size.x, height: size.y
  end
end

# A two-dimensional vector.
alias Vector2 = Raylib::Vector2

# Creates a `Raylib::Vector2` from another `Raylib::Vector2`.
def vec(v : Raylib::Vector2) : Vector2
  Raylib::Vector2.new(v.x, v.y)
end

# Creates a `Raylib::Vector2`.
def vec(x : Number, y : Number) : Vector2
  Raylib::Vector2.new(x, y)
end

# Creates a `Raylib::Vector2`.
def vec : Vector2
  Raylib::Vector2.new
end
