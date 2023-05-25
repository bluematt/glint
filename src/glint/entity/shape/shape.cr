module Glint
  module Shape
    # A `Shape` is a generic shape entity that can be drawn.
    abstract class Shape < Glint::Entity::Entity
      # The shape's foreground (outline) color.
      property foreground_color : Color?
      # The shape's background (fill) color.
      property background_color : Color?
    end
  end
end

require "./circle.cr"
require "./line.cr"
require "./polygon.cr"
require "./rectangle.cr"
require "./square.cr"
