# A wrapper for `Raylib::Color`.
#
# It provides access to a number of Raylib's color functions.
#
# Always on the look out for more named color palettes!
struct Color
  @c : Raylib::Color

  # Creates a colour from a `Raylib::Color`.
  def initialize(@c : Raylib::Color); end

  # Creates a color from an RGB(A) tuple.
  def initialize(r : Number, g : Number, b : Number, a : Number = 255)
    @c = Raylib::Color.new r: r, g: g, b: b, a: a
  end

  # Creates a colour from a 6- or 8-byte hex string (e.g. `#ffcc00` or `FFCC0080`).
  #
  # The string can optionally begin with `#` (e.g. when using CSS-style colours).
  # If the alpha component is not specified, it assumes `FF` (255) for the alpha
  # component.
  def initialize(hex_color : String)
    hex = hex_color.lstrip('#')
    raise ArgumentError.new("Invalid hex color #{hex_color}") unless hex.size.in? [6, 8]
    value = hex.to_i64(16)
    value = (value << 8) | 0xFF if hex.size == 6
    raise ArgumentError.new("Invalid hex color #{hex_color}") if value > 0xFFFFFFFF
    @c = Color.new(value).to_unsafe
  end

  # Creates a color from a value.
  #
  # It could actually be any valid Crystal number, but it probably expects an 8-byte
  # hex (`0xNNNNNNNN`) number.
  def initialize(value : Number)
    raise ArgumentError.new("Invalid color value #{value}") if value > 0xFFFFFFFF
    @c = Color.new(Raylib.get_color(value)).to_unsafe
  end

  def initialize(values : Tuple(Int32, Int32, Int32) | Tuple(Int32, Int32, Int32, Int32))
    raise ArgumentError.new("Invalid color values #{values}") unless values.size.in? [3, 4]
    @c = Color.new(*values).to_unsafe
  end

  # struct RGB
  #   struct Hex; end
  # end
  #
  # struct HSV; end
  #
  # struct CMYK; end

  LIGHTGRAY  = Color.new(200, 200, 200, 255)
  GRAY       = Color.new(130, 130, 130, 255)
  DARKGRAY   = Color.new(80, 80, 80, 255)
  YELLOW     = Color.new(253, 249, 0, 255)
  GOLD       = Color.new(255, 203, 0, 255)
  ORANGE     = Color.new(255, 161, 0, 255)
  PINK       = Color.new(255, 109, 194, 255)
  RED        = Color.new(230, 41, 55, 255)
  MAROON     = Color.new(190, 33, 55, 255)
  GREEN      = Color.new(0, 228, 48, 255)
  LIME       = Color.new(0, 158, 47, 255)
  DARKGREEN  = Color.new(0, 117, 44, 255)
  SKYBLUE    = Color.new(102, 191, 255, 255)
  BLUE       = Color.new(0, 121, 241, 255)
  DARKBLUE   = Color.new(0, 82, 172, 255)
  PURPLE     = Color.new(200, 122, 255, 255)
  VIOLET     = Color.new(135, 60, 190, 255)
  DARKPURPLE = Color.new(112, 31, 126, 255)
  BEIGE      = Color.new(211, 176, 131, 255)
  BROWN      = Color.new(127, 106, 79, 255)
  DARKBROWN  = Color.new(76, 63, 47, 255)
  WHITE      = Color.new(255, 255, 255, 255)
  BLACK      = Color.new(0, 0, 0, 255)
  MAGENTA    = Color.new(255, 0, 255, 255)
  RAYWHITE   = Color.new(245, 245, 245, 255)
  BLANK      = Color.new(0, 0, 0, 0)

  RAYLIB_COLORS = [
    LIGHTGRAY, GRAY, DARKGRAY, YELLOW, GOLD,
    ORANGE, PINK, RED, MAROON, GREEN,
    LIME, DARKGREEN, SKYBLUE, BLUE, DARKBLUE,
    PURPLE, VIOLET, DARKPURPLE, BEIGE, BROWN,
    DARKBROWN, WHITE, BLACK, MAGENTA, RAYWHITE,
    BLANK,
  ]

  # Palette representing the two colours available in a one-bit palette.
  ONE_BIT = {
    :black => Color.new(0, 0, 0),
    :white => Color.new(255, 255, 255),
  }

  # Palette representing the sixteen colours available on the
  # Commodore 64.  Source: [https://www.c64-wiki.com/wiki/Color](https://www.c64-wiki.com/wiki/Color)
  C64 = {
    :black       => Color.new(0, 0, 0),
    :white       => Color.new(255, 255, 255),
    :red         => Color.new(136, 0, 0),
    :cyan        => Color.new(170, 255, 238),
    :violet      => Color.new(204, 68, 204),
    :green       => Color.new(0, 204, 85),
    :blue        => Color.new(0, 0, 170),
    :yellow      => Color.new(238, 238, 119),
    :orange      => Color.new(221, 136, 85),
    :brown       => Color.new(102, 68, 0),
    :light_red   => Color.new(255, 119, 119),
    :grey_1      => Color.new(51, 51, 51),
    :grey_2      => Color.new(119, 119, 119),
    :light_green => Color.new(170, 255, 102),
    :light_blue  => Color.new(0, 136, 255),
    :grey_3      => Color.new(187, 187, 187),
  }

  # CGA           = {} of Symbol => Color
  # HTML_3_2      = {} of Symbol => Color # Same as CGA, but colors are renamed
  # HTML_EXTENDED = {} of Symbol => Color
  # WEB_SAFE      = {} of Symbol => Color
  # WEB_SAFEST    = {} of Symbol => Color

  COLOR_RANGE   = 0..255
  MAXIMUM_VALUE = 255

  # Returns the red component.
  def r
    @c.r
  end

  # Sets the red component.
  #
  # Returns the `Raylib::Color` so it can be changed with `#modulate`.
  def r=(value : Number)
    @c.r = value
    @c
  end

  # Returns the green component.
  def g
    @c.g
  end

  # Sets the green component.
  #
  # Returns the `Raylib::Color` so it can be changed with `#modulate`.
  def g=(value : Number)
    @c.g = value
    @c
  end

  # Returns the blue component.
  def b
    @c.b
  end

  # Sets the blue component.
  #
  # Returns the `Raylib::Color` so it can be changed with `#modulate`.
  def b=(value : Number)
    @c.b = value
    @c
  end

  # Returns the alpha component.
  def a
    @c.a
  end

  # Sets the alpha component.
  #
  # Returns the `Raylib::Color` so it can be changed with `#modulate`.
  def a=(value : Number)
    @c.a = value
    @c
  end

  # Picks a random `Color` from the predefined Raylib colors.
  def self.random_raylib
    RAYLIB_COLORS.sample
  end

  # Creates a random `Color` from the predefined named colors.
  def self.random(transparency : Number = MAXIMUM_VALUE)
    Color.new(COLOR_RANGE.sample, COLOR_RANGE.sample, COLOR_RANGE.sample, transparency)
  end

  # Creates a random colour with the specified RGB(A) `Range`s.
  def self.random(r_range : Range, g_range : Range, b_range : Range, a_range : Range = COLOR_RANGE)
    Color.new(r_range.sample.to_u8, g_range.sample.to_u8, b_range.sample.to_u8, a_range.sample.to_u8)
  end

  # Creates a grey with the specific value.
  def self.grey(value : Number)
    Color.new(value, value, value, MAXIMUM_VALUE)
  end

  # Sets the alpha value to 0.
  def transparent!
    @c.a = 0
    self
  end

  # Returns the color's red channel only.
  def red
    Color.new(@r, 0, 0, 0)
  end

  # Returns the color's green channel only.
  def green
    Color.new(0, @g, 0, 0)
  end

  # Returns the color's blue channel only.
  def blue
    Color.new(0, 0, @b, 0)
  end

  # Returns the color's alpha channel only.
  def alpha
    Color.new(0, 0, 0, @a)
  end

  # Returns whether the colour is fully transparent.
  def transparent?
    @a == 0
  end

  # Returns whether the color is semitransparent.
  def semitransparent?
    translucent?
  end

  # :ditto:
  def translucent?
    @a < MAXIMUM_VALUE
  end

  # Mixes a color with another color to make a new color.
  def self.mix(c1 : Color, c2 : Color)
    Color.new(Raylib.color_tint(c1, c2))
  end

  # Mixes the color with another color to make a new color.
  def mix(other : Color)
    Color.mix(self, other)
  end

  # Changes the color to a mix with with another color.
  def mix!(other : Color)
    @c = mix(other).to_unsafe
    self
  end

  # Returns a string representation of the color.
  def to_s(io : IO)
    io << @c
  end

  # Returns the color in a C-compatible format, i.e. as `Raylib::Color`.
  #
  # This allows for transparent interoperability with the Raylib library.
  def to_unsafe
    @c
  end

  # Returns the color's values as a `Hash`.
  def to_hash
    {
      :r => @r,
      :g => @g,
      :b => @b,
      :a => @a,
    }
  end

  # Returns the color's values as a `Tuple`.
  def to_tuple
    {
      @r,
      @g,
      @b,
      @a,
    }
  end

  # :ditto:
  def values
    to_tuple
  end

  # Takes a block and modulates (changes) the color in the way defined by the block.
  #
  # Example:
  # ```
  # # This takes the predefined `BLACK` colour and makes it semitransparent.
  # transparent_black = Color::BLACK.modulate { |c| c.a = 127 } # => {255, 255, 255, 127}
  # ```
  def modulate(&block)
    @c = yield self
    self
  end

  def to_hex; end

  forward_missing_to @c
end

# Creates a `Color` from a `Raylib::Color`.
def color(c : Raylib::Color)
  Color.new(c)
end

# Creates a `Color` from a hex string.
def color(hex : String)
  Color.new(hex)
end

# Creates a `Color` from a value.
def color(value : Number)
  Color.new(value)
end

# Creates a `Color`.
def color(r : Number, g : Number, b : Number, a : Number = Color::MAXIMUM_VALUE)
  Color.new(r, g, b, a)
end

# Creates a `Color` from a tuple.
def color(values : Tuple(Int32, Int32, Int32) | Tuple(Int32, Int32, Int32, Int32))
  Color.new(values)
end
