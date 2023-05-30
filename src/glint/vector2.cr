# A wrapper for `Raylib::Vector`.
#
# It provides access to a number of Raylib's Raymath vector library
# functions.
#
# Some methods reimplemented from https://github.com/unn4m3d/crystaledge/blob/master/src/crystaledge/vector2.cr
struct Vector2
  # The wrapped `Raylib::Vector`.
  @v : Raylib::Vector2

  # Creates a new vector from `Raylib::Vector`.
  def initialize(@v : Raylib::Vector2); end

  # Creates a new vector from x/y components.
  def initialize(x : Number = 0, y : Number = 0)
    @v = Raylib::Vector2.new x: x, y: y
  end

  # A zero vector.
  ZERO = Vector2.new(0, 0)
  # A unit vector.
  ONE = Vector2.new(1, 1)
  # :ditto:
  UNIT = ONE

  # Vector representing the up direction.
  UP = Vector2.new(0, -1)
  # Vector representing the right direction.
  RIGHT = Vector2.new(1, 0)
  # Vector representing the down direction.
  DOWN = Vector2.new(0, 1)
  # Vector representing the left direction.
  LEFT = Vector2.new(-1, 0)

  # Vector representing the up-right direction.
  UP_RIGHT = UP + RIGHT
  # Vector representing the down-right direction.
  DOWN_RIGHT = DOWN + RIGHT
  # Vector representing the down-left direction.
  DOWN_LEFT = DOWN + LEFT
  # Vector representing the up-left direction.
  UP_LEFT = UP + LEFT

  # Vector representing the north direction.
  NORTH = UP
  # Vector representing the south direction.
  SOUTH = DOWN
  # Vector representing the west direction.
  WEST = LEFT
  # Vector representing the east direction.
  EAST = RIGHT

  # Vector representing the north east direction.
  NORTH_EAST = NORTH + EAST
  # Vector representing the south east direction.
  SOUTH_EAST = SOUTH + EAST
  # Vector representing the south west direction.
  SOUTH_WEST = SOUTH + WEST
  # Vector representing the north west direction.
  NORTH_WEST = NORTH + WEST

  # Returns the vector's x component.
  def x
    @v.x
  end

  # Set the vector's x component.
  def x=(value : Number)
    @v.x = value
  end

  # Returns the vector's y component.
  def y
    @v.y
  end

  # Set the vector's y component.
  def y=(value : Number)
    @v.y = value
  end

  # Returns a (0, 0) vector.
  def self.zero
    ZERO
  end

  # Zeroes the vector.
  def zero!
    @v = ZERO.unsafe
    self
  end

  # Returns whether the vector is zero.
  def zero?
    self == ZERO
  end

  # Returns whether the vector is the unit vector.
  def one?
    self == ONE
  end

  # :ditto:
  def unit?
    self == UNIT
  end

  # Returns a (1, 1) vector.
  def self.one
    ONE
  end

  # Alias for `self#one`.
  def self.unit
    self.one
  end

  # Adds another vector to the vector.
  def +(other : Vector2)
    # Vector2.new(@v.x + other.x, @v.y + other.y)
    Vector2.new(Raymath.vector2_add(self, other))
  end

  # Adds a value to the vector's components.
  def +(value : Number)
    # Vector2.new(@v.x + value, @v.y + value)
    Vector2.new(Raymath.vector2_add_value(self, value))
  end

  # Negates the vector.
  def -
    Vector2.new(Raymath.vector2_negate(self))
  end

  # Subtracts another vector from the vector.
  def -(other : Vector2)
    Vector2.new(Raymath.vector2_subtract(self, other))
  end

  # Subtracts a value from the vector components.
  def -(value : Number)
    Vector2.new(Raymath.vector2_subtract_value(self, value))
  end

  # Multiplies a vector by a factor vector. See also `#dot` and `#cross` products.
  def *(other : Vector2)
    # Vector2.new(@v.x * other.x, @v.y * other.y)
    Vector2.new(Raymath.vector2_multiply(self, other))
  end

  # Multiplies a vector by a factor.
  def *(factor : Number)
    # Vector2.new(@v.x * factor, @v.y * factor)
    Vector2.new(Raymath.vector2_scale(self, factor))
  end

  # Divides a vector by another vector.
  def /(other : Vector)
    Vector2.new(Raymath.vector2_divide(self, other))
  end

  # Divides a vector by a factor.
  def /(factor : Number)
    # Vector2.new(@v.x * factor, @v.y * factor)
    Vector2.new(Raymath.vector2_scale(self, 1/factor))
  end

  # Returns the length of a vector.
  def length
    Raymath.vector2_length(@v)
  end

  # :ditto:
  def magnitude
    length
  end

  # Returns the square of the length of a vector.
  def length_sqr
    Raymath.vector2_length_sqr(@v)
  end

  # :ditto:
  def magnitude_sqr
    length_sqr
  end

  # Returns a vector scaled by a factor.
  def self.scale(v : Vector2, factor : Number)
    Vector2.new(Raymath.vector2_scale(v, factor))
  end

  # Returns the vector scaled by a factor.
  def scale(factor : Number)
    Vector2.scale(self, factor)
  end

  # Scales the vector by a factor.
  def scale!(factor : Number)
    @v = scale(factor)
    self
  end

  # Returns the dot product of two vectors.
  def self.dot(v1 : Vector2, v2 : Vector2)
    Raymath.vector2_dot_product(v1, v2)
  end

  # Returns the dot product with another vector.
  def dot(other : Vector2)
    Vector2.dot(self, other)
  end

  # :ditto:
  def **(other : Vector2)
    dot(other)
  end

  # Returns the cross product of two vectors.
  def self.cross(v1 : Vector2, v2 : Vector2)
    Vector2.new(v1.x * v2.y - v1.y * v2.x, v1.y * v2.x - v1.x * v2.y)
  end

  # Returns the cross product with another vector.
  def cross(other : Vector2)
    Vector2.cross(self, other)
  end

  # :ditto:
  def %(other : Vector2)
    cross(other)
  end

  # Returns the distance between two vectors.
  def self.distance_between(v1 : Vector2, v2 : Vector2)
    Raymath.vector2_distance(v1, v2)
  end

  # Returns the distance to another vector.
  def distance_to(other : Vector2)
    Vector2.distance_between(self, other)
  end

  # Returns the angle between two vectors.
  def self.angle_between(v1 : Vector2, v2 : Vector2)
    Raymath.vector2_angle(v1, v2)
  end

  # Returns the angle to another vector.
  def angle_to(other : Vector2)
    Vector2.angle_between(self, other)
  end

  # Returns the direction of the vector.
  def angle
    Math.atan2(@v.y, @v.x)
  end

  # :ditto:
  def heading
    angle
  end

  # Returns a vector rotated about an angle.
  def self.rotate(v : Vector2, angle : Number)
    Vector2.new(Raylib.vector2_rotate(v, angle))
  end

  # Returns the vector rotated about an angle.
  def rotate(angle : Number)
    Vector2.rotate(self, angle)
  end

  # Rotates the vector about an angle.
  def rotate!(angle : Number)
    @v = rotate(angle).to_unsafe
    self
  end

  # Returns a vector reflected relative to the normal.
  def self.reflect(v : Vector2, normal : Vector2)
    Vector2.new(Raymath.vector2_reflect(v, normal))
  end

  # Returns the vector reflected relative to the normal.
  def reflect(normal : Vector2)
    Vector2.reflect(self, normal)
  end

  # Reflects the vector relative to the normal.
  def reflect!(normal : Vector2)
    @v = reflect(normal).to_unsafe
    self
  end

  # Returns a vector reflected vertically.
  def self.reflect_from_vertical(v : Vector2)
    Vector2.reflect(v, LEFT)
  end

  # Returns the vector reflected vertically.
  def reflect_from_vertical
    Vector2.reflect_from_vertical(self)
  end

  # Reflects the vector vertically.
  def reflect_from_vertical!
    @v = self.reflect_from_vertical.to_unsafe
    self
  end

  # Returns a vector reflected horizontally.
  def self.reflect_from_horizonal(v : Vector2)
    Vector2.reflect(v, DOWN)
  end

  # Returns the vector reflected horizontally.
  def reflect_from_horizonal
    Vector2.reflect_from_horizonal(self)
  end

  # Reflects the vector horizontally.
  def reflect_from_horizonal!
    @v = self.reflect_from_horizonal.to_unsafe
    self
  end

  # Returns a normalized vector.
  def self.normalize(v : Vector2)
    Vector2.new(Raymath.vector2_normalize(v))
  end

  # Returns the normalized vector.
  def normalize
    Vector2.normalize(self)
  end

  # Normalizes the vector.
  def normalize!
    @v = normalize.to_unsafe
    self
  end

  # Returns whether the vector is normalized (has a length of 1.0).
  def normalized?
    self.length == 1
  end

  #   # Finds normal axis between two vectors
  #   def find_normal_axis(other : Vector2)
  #     (self % other).normalize
  #   end

  # Returns the linear interpolation between two vectors at a certain amount.
  def self.lerp(v1 : Vector2, v2 : Vector2, amount : Number)
    Vector2.new(Raymath.vector2_lerp(v1, v2, amount))
  end

  # Returns the linear interpolation to another vector at a certain amount.
  def lerp(other : Vector2, amount : Number)
    Vector2.lerp(self, other, amount)
  end

  # Linearly interpolates to another vector at a certain amount.
  def lerp!(other : Vector2, amount : Number)
    @v = lerp(other, amount).to_unsafe
    self
  end

  # Moves a vector towards another vector by a maximum distance.
  def self.move_towards(v1 : Vector2, v2 : Vector2, maximum_distance : Number)
    Vector2.new(Raymath.vector2_move_towards(v1, v2, maximum_distance))
  end

  # Moves the vector towards another vector by a maximum distance.
  def move_towards(v : Vector2, maximum_distance : Number)
    Vector2.move_towards(self, v, maximum_distance)
  end

  # Moves towards another vector by a maximum distance.
  def move_towards!(v : Vector2, maximum_distance : Number)
    @v = move_towards(v, maximum_distance).to_unsafe
    self
  end

  # Clamps a vector to min/max x and y values.
  def self.clamp(v : Vector2, min_x : Number, max_x : Number, min_y : Number, max_y : Number)
    Vector2.new(v.x.clamp(min_x, max_x), v.y.clamp(min_y, max_y))
  end

  # Clamps the vector to min/max x and y values.
  def clamp(min_x : Number, max_x : Number, min_y : Number, max_y : Number)
    Vector2.clamp(self, min_x, max_x, min_y, max_y)
  end

  # Clamps min/max x and y values.
  def clamp!(min_x : Number, max_x : Number, min_y : Number, max_y : Number)
    @v = clamp(min_x, max_x, min_y, max_y).to_unsafe
    self
  end

  # Clamps a vector to min/max x and y ranges.
  def self.clamp(v : Vector2, x_range : Range, y_range : Range)
    Vector2.new(v.x.clamp(x_range), v.y.clamp(y_range))
  end

  # Clamps the vector to min/max x and y ranges.
  def clamp(x_range : Range, y_range : Range)
    Vector2.clamp(self, x_range, y_range)
  end

  # Clamps min/max x and y ranges.
  def clamp!(x_range : Range, y_range : Range)
    @v = clamp(x_range, y_range).to_unsafe
    self
  end

  # Returns whether two vectors are equal.
  def ==(other : Vector2)
    self.x == other.x && self.y == other.y
  end

  # Returns whether two vectors are not equal.
  def !=(other : Vector2)
    self.x != other.x || self.y != other.y
  end

  # Clones the vector and passes it into a block if given.
  def clone
    Vector2.new(@v)
  end

  # :ditto:
  def clone(&b)
    c = clone
    b.call c
    c
  end

  # Returns a string representation of the vector.
  def to_s(io : IO)
    io << @v
  end

  # Returns the vector in a C-compatible format, i.e. as `Raylib::Vector2`.
  #
  # This allows for transparent interoperability with the Raylib library.
  def to_unsafe
    @v
  end

  # Returns the vector's values as a `Hash`.
  def to_hash
    {
      :x => @v.x,
      :y => @v.y,
    }
  end

  # Returns the vector's values as a `Tuple`.
  def to_tuple
    {
      @v.x,
      @v.y,
    }
  end

  # :ditto:
  def values
    to_tuple
  end

  # Returns a `Rect` with the size of the `Vector2`.
  def to_rect
    Rect.new(0, 0, self)
  end

  # Returns a `Rect` at `Vector2` with a specific *size*.
  def to_rect(size : Dimension)
    Rect.new(self, size)
  end

  # Returns a `Rect` at `Vector2` with a specific *width* and *height*.
  def to_rect(width : Number, height : Number)
    Rect.new(self, width, height)
  end

  # :ditto:
  def to_rect(width : Number, height : Number)
    Raylib::Rectangle.new x: x, y: y, width: width, height: height
  end

  # Returns the x component as a width.
  def width
    x
  end

  # Returns the y component as a height.
  def height
    y
  end

  # Returns whether the `Vector2`, when considered as a dimension, would be invalid.
  def is_invalid_dimension?
    self.width < 0 || self.height < 0
  end

  # Takes a block and adjusts the `Vector2` in the way(s) defined by the block.
  def adjust(&block)
    @v = yield self
    self
  end

  forward_missing_to(@v)
end

# Creates a `Vector2` from a `Raylib::Vector2`.
def vec(v : Raylib::Vector2)
  Vector2.new(v)
end

# Creates a `Vector2`.
def vec(x : Number = 0, y : Number = 0)
  Vector2.new(x, y)
end

# A `Position` is a `Vector2`.
alias Position = Vector2

# Creates a `Position` from x and y coordinates.
def p(x, y)
  Position.new(x, y)
end

# Creates a `Position` from a `Vector2`.
def p(v : Vector2)
  Position.new(v)
end

# A `Dimension` is a `Vector2`.
alias Dimension = Vector2

# Creates a `Dimension` from x and y coordinates.
def size(x, y)
  Dimension.new(x, y)
end

# Creates a `Dimension` from a `Vector2`.
def size(v : Vector2)
  Dimension.new(v)
end
