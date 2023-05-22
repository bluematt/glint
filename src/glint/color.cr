module Glint
  class Color
    property r, g, b, a : UInt8

    WHITE       = Color.new(255, 255, 255, 255)
    BLACK       = Color.new(0, 0, 0, 255)
    TRANSPARENT = Color.new(0, 0, 0, 0)

    def initialize(@r, @g, @b, @a); end

    def initialize(@r, @g, @b)
      @a = 255
    end

    def initialize
      @r = 255
      @g = 255
      @b = 255
      @a = 255
    end

    def mix(other : Color); end

    def mix(other : Color, percentage : Float32); end

    def lighten(percentage : Float32); end

    def darken(percentage : Float32); end

    # Return the Raylib representation of this color.
    @[AlwaysInline]
    def to_raylib
      Raylib::Color.new r: @r, g: @g, b: @b, a: @a
    end
  end
end

# Convenience alias for `Glint::Color`.
alias Color = Glint::Color
