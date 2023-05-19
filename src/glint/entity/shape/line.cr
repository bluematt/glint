module Glint
  module Shape
    class Line < Shape
      def draw
        return if @foreground_color.nil?
      end
    end
  end
end

alias Line = Glint::Shape::Line
