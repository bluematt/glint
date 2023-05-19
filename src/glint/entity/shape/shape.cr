module Glint
  module Shape
    # A `Shape` is a generic shape `GameObject` that can be drawn.
    abstract class Shape < Glint::Entity::VisualGameObject
      # The shape's foreground (outline) color.
      property foreground_color : Color?
      # The shape's background (fill) color.
      property background_color : Color?
    end
  end
end

require "./box.cr"
require "./circle.cr"
require "./line.cr"
require "./polygon.cr"
require "./square.cr"
