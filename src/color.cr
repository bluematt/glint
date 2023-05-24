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
  def initialize(r : UInt8, g : UInt8, b : UInt8, a : UInt8 = 255)
    @c = Raylib::Color.new r: r, g: g, b: b, a: a
  end

  # Creates a color from a (hex) number.
  #
  # It could actually be any valid Crystal number.
  def initialize(hex : Number)
    @c = Color.new(Raylib.get_color(hex))
  end

  # Creates a colour from a hex string.
  def initialize(hex : String)
    @c = Color.new(Raylib.get_color(hex.to_i(16)))
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

  # Returns the red component.
  def r
    @c.r
  end

  # Sets the red component.
  def r=(value : UInt8)
    @c.r = value
  end

  # Returns the green component.
  def g
    @c.g
  end

  # Sets the green component.
  def g=(value : UInt8)
    @c.g = value
  end

  # Returns the blue component.
  def b
    @c.b
  end

  # Sets the blue component.
  def b=(value : UInt8)
    @c.b = value
  end

  # Returns the alpha component.
  def a
    @c.a
  end

  # Sets the alpha component.
  def a=(value : UInt8)
    @c.a = value
  end

  # Picks a random `Color` from the predefined Raylib colors.
  def self.random_raylib
    RAYLIB_COLORS.sample
  end

  # Creates a random `Color` from the predefined named colors.
  def self.random(transparency : UInt8 = 255)
    Color.new(0..255.sample, 0..255.sample, 0..255.sample, transparency)
  end

  # Creates a random colour with the specified RGB(A) `Range`s.
  def self.random(r_range : Range, g_range : Range, b_range : Range, a_range : Range = 0..255)
    Color.new(r_range.sample.to_u8, g_range.sample.to_u8, b_range.sample.to_u8, a_range.sample.to_u8)
  end

  # Creates a grey with the specific value.
  def self.grey(value : UInt8)
    Color.new(value, value, value, 255)
  end

  # Sets the alpha value to 0.
  def transparent!
    @a = 0
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
    @a < 255
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

  def to_tuple
    {
      @r,
      @g,
      @b,
      @a,
    }
  end

  def values
    to_tuple
  end

  def to_hash
    {
      :r => @r,
      :g => @g,
      :b => @b,
      :a => @a,
    }
  end

  def to_hex; end

  forward_missing_to @c
end

# Creates a `Color` from a `Raylib::Color`.
def col(c : Raylib::Color)
  Color.new(c)
end

# Creates a `Color` from a hex string.
def col(hex : String)
  Color.new(hex)
end

# Creates a `Color`.
def col(r : UInt8, g : UInt8, b : UInt8, a : UInt8 = 255)
  Color.new(r, g, b, a)
end