module Glint
  module Control
    class Label < Control
      property text : String
      property x, y, font_size : Int32
      property color : Color

      def initialize(@text, @position, @font_size, @color); end

      def draw!
        self.inspect
      end
    end
  end
end

alias Label = Glint::Control::Label
