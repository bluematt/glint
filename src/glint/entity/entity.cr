module Glint
  module Entity
    # A generic entity class.
    #
    # An entity is responsible for keeping track of it's own an child entities.
    abstract class Entity
      # Returns the entity's parent, if any.
      getter parent : (Entity | Game)?

      # Returns the child entities.
      getter children : Array(Entity) = [] of Entity

      # Whether the entity is visible or not.
      property visible : Bool = true

      # Whether to draw this entity's child entities.
      property draw_children : Bool = true

      # Whether to draw this entity above its child entities.
      property draw_above_children : Bool = false

      # How and when the entity (and its children) is updated.
      property update_mode : UpdateMode = UpdateMode::Inherit

      # Updates the entity and its children.
      #
      # Updates are only applied if the `update_mode` allows it, either specifically
      # or by inheriting from its parent.
      protected def _update(delta) : Nil
        case
        when @update_mode.disabled?
          return
        else
          @children.each { |e| e._update(delta) }
          update(delta)
        end
      end

      # Updates the entity.
      #
      # Updates are only applied if the `update_mode` allows it.
      def update(delta); end

      # Draws the entity and its children.
      protected def _draw
        # Draws the children under the current entity.
        if @draw_children
          @children.each { |e| e._draw } unless draw_above_children
        end

        draw

        # Draws the children above the current entity.
        if @draw_children
          @children.each { |e| e._draw } if draw_above_children
        end
      end

      # Draws the entity.
      #
      # This performs any drawing specific for *this* entity.  Any entities in
      # `@children` will be drawn automatically (if applicable).
      def draw; end

      # Add an entity to the entity's children for managing later.
      #
      # ```
      # class MyScene < Scene # Scene is an Entity
      #   def initialize
      #     @spaceship = Spaceship.new
      #     self << @spaceship
      #   end
      # end
      # ```
      def <<(other : Entity)
        @children << other
      end

      # Remove an entity from the entity's children, if it exists.
      #
      # ```
      # if health <= 0
      #   self.delete @spaceship
      # end
      # ```
      def delete(other : Entity)
        @children.reject { |e| e == other }
      end

      # Returns whether the entity is in the children.
      def has?(other : Entity)
        @children.any? other
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
