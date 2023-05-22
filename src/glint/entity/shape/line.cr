module Glint
  module Shape
    class Line < Shape
      def draw
        return if @foreground_color.nil?
      end
    end
  end
end

# Convenience alias for `Glint::Shape::Line`.
alias Line = Glint::Shape::Line
