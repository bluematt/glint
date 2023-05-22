module Glint
  module Physics
    # A game object that has physics properties.
    abstract class PhysicsObject < Glint::Entity::Entity
      property velocity : Velocity = Velocity.new
    end
  end
end

require "./kinematic_body.cr"
require "./rigid_body.cr"
require "./static_body.cr"
