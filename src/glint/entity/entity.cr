module Glint
  # An entity is responsible for keeping track of it's own an child entities.
  module Entity
    abstract class Entity
      # # Whether the entity has been initialised.
      # @initialized = false

      # The entity's parent, if any.
      @parent : (Entity | Game)?

      # The child entities of this entity.
      @children : Array(Entity) = [] of Entity

      # Whether the entity is visible or not.
      property visible : Bool = true

      protected def _update(delta)
        @children.each { |e| e._update(delta) }
        update(delta)
      end

      # Update the entity.
      def update(delta); end

      protected def _draw
        @children.each { |e| e._draw }
        draw
      end

      # Draw the entity.
      def draw; end

      # Add an entity to the entity's children.
      def <<(other : Entity)
        @children << other
      end

      # Return the entity's parent.
      def parent
        @parent
      end
    end
  end
end

require "./game_object.cr"
require "./scene.cr"
require "./visual_game_object.cr"
require "./sprite.cr"

require "./control/control.cr"
require "./physics/physics_object.cr"
require "./shape/shape.cr"
