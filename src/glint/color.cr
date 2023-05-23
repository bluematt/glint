module Glint
  class Color
    property r, g, b, a : UInt8

    LIGHTGRAY  = Color.new(200, 200, 200, 255) # Light Gray
    GRAY       = Color.new(130, 130, 130, 255) # Gray
    DARKGRAY   = Color.new(80, 80, 80, 255)    # Dark Gray
    YELLOW     = Color.new(253, 249, 0, 255)   # Yellow
    GOLD       = Color.new(255, 203, 0, 255)   # Gold
    ORANGE     = Color.new(255, 161, 0, 255)   # Orange
    PINK       = Color.new(255, 109, 194, 255) # Pink
    RED        = Color.new(230, 41, 55, 255)   # Red
    MAROON     = Color.new(190, 33, 55, 255)   # Maroon
    GREEN      = Color.new(0, 228, 48, 255)    # Green
    LIME       = Color.new(0, 158, 47, 255)    # Lime
    DARKGREEN  = Color.new(0, 117, 44, 255)    # Dark Green
    SKYBLUE    = Color.new(102, 191, 255, 255) # Sky Blue
    BLUE       = Color.new(0, 121, 241, 255)   # Blue
    DARKBLUE   = Color.new(0, 82, 172, 255)    # Dark Blue
    PURPLE     = Color.new(200, 122, 255, 255) # Purple
    VIOLET     = Color.new(135, 60, 190, 255)  # Violet
    DARKPURPLE = Color.new(112, 31, 126, 255)  # Dark Purple
    BEIGE      = Color.new(211, 176, 131, 255) # Beige
    BROWN      = Color.new(127, 106, 79, 255)  # Brown
    DARKBROWN  = Color.new(76, 63, 47, 255)    # Dark Brown
    WHITE      = Color.new(255, 255, 255, 255) # White
    BLACK      = Color.new(0, 0, 0, 255)       # Black
    BLANK      = Color.new(0, 0, 0, 0)         # Blank (Transparent)
    MAGENTA    = Color.new(255, 0, 255, 255)   # Magenta
    RAYWHITE   = Color.new(245, 245, 245, 255) # My own White (raylib logo)

    COLORS = [
      LIGHTGRAY,
      GRAY,
      DARKGRAY,
      YELLOW,
      GOLD,
      ORANGE,
      PINK,
      RED,
      MAROON,
      GREEN,
      LIME,
      DARKGREEN,
      SKYBLUE,
      BLUE,
      DARKBLUE,
      PURPLE,
      VIOLET,
      DARKPURPLE,
      BEIGE,
      BROWN,
      DARKBROWN,
      WHITE,
      BLACK,
      BLANK,
      MAGENTA,
      RAYWHITE,
    ]

    # Creates a `Color` with RBGA components.
    def initialize(@r, @g, @b, @a); end

    # Creates a `Color` with RBG components.
    def initialize(@r, @g, @b)
      @a = 255
    end

    # Creates a new `Color`.  Defaults to pure white.
    def initialize
      @r = 255
      @g = 255
      @b = 255
      @a = 255
    end

    # Creates a `Color` from a `Raylib::Color`.
    def initialize(raylib_color : Raylib::Color)
      @r = raylib_color.r
      @g = raylib_color.g
      @b = raylib_color.b
      @a = raylib_color.a
    end

    # Mixes the `Color` with another `Color` to create a new `Color`.
    def mix(other : Color)
      self.new(Raylib.color_tint(self.to_raylib, other.to_raylib))
    end

    # Mixes the `Color` with a percentage of another `Color` to create a new `Color`.
    # TODO
    def mix(other : Color, percentage : Float32); end

    # Lightens the `Color` by a percentage.
    # TODO
    def lighten(percentage : Float32)
      Color.lighten(self, percentage)
    end

    # Darkens the `Color` by a percentage.
    # TODO
    def darken(percentage : Float32)
      Color.darken(self, percentage)
    end

    # Return the Raylib representation of this color.
    @[AlwaysInline]
    def to_raylib
      Raylib::Color.new r: @r, g: @g, b: @b, a: @a
    end

    # Picks a random `Color` from the predefined colors.
    def self.random
      COLORS.sample
    end

    # Creates a random grey colour in the `Range` *range*.
    def self.random(range : Range)
      Color.new(range.sample)
    end

    # Creates a random colour with the specified RGB `Range`s.
    def self.random(r_range : Range, g_range : Range, b_range : Range)
      Color.new(r_range.sample, g_range.sample, b_range.sample)
    end

    # Creates a random colour with the specified RGBA `Range`s.
    def self.random(r_range : Range, g_range : Range, b_range : Range, a_range : Range)
      Color.new(r_range.sample, g_range.sample, b_range.sample, a_range.sample)
    end

    # Darkens a `Color` by a percentage.
    # TODO FIXME
    def self.darken(color, percentage)
      Color.new(Raylib.color_brightness(color.to_raylib, percentage))
    end

    # Lightens a `Color` by a percentage.
    # TODO FIXME
    def self.lighten(color, percentage)
      Color.new(Raylib.color_brightness(color.to_raylib, percentage))
    end

    # Mixes the `Color` with another `Color` to create a new `Color`.
    def mix(color1, color2)
      Color.new(Raylib.color_tint(color1.to_raylib, color2.to_raylib))
    end

    # Mixes the `Color` with a percentage of another `Color` to create a new `Color`.
    # TODO
    def mix(color1, color2, percentage)
    end
  end
end

# Convenience alias for `Glint::Color`.
alias Color = Glint::Color
