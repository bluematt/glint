module Glint
  module Control
    # An abstract class representing a visual control entity.
    abstract class Control < Glint::Entity::VisualGameObject; end
  end
end

require "./label.cr"
