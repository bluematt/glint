module Glint
  module Control
    # An abstract class representing a visual control entity.
    abstract class Control < Glint::Entity::Entity; end
  end
end

require "./label.cr"
