module Glint
  module Entity
    # A generic entity class.
    #
    # An entity is responsible for keeping track of it's own an child entities.
    abstract class Entity
      # The entity's default position.
      DEFAULT_POSITION = Vector2.zero

      # The entity's default rotation, in degrees.
      DEFAULT_ROTATION = 0.0

      # The entity's default pivot.
      DEFAULT_ORIGIN = Origin::TopLeft

      # The entity's parent, if any.
      property parent : (Entity | Game)?

      # Returns the child entities.
      getter children : Array(Entity) = [] of Entity

      # The entity's position.
      @position : Vector2 = DEFAULT_POSITION

      # The entity's rotation.
      @rotation = DEFAULT_ROTATION

      # The entity's point of transformation.
      property pivot : Origin = DEFAULT_ORIGIN

      # Whether the entity is visible or not.
      property visible : Bool = true

      # Whether to draw this entity's child entities.
      property draw_children : Bool = true

      # Whether to draw this entity above its child entities.
      property draw_above_children : Bool = false

      # The entity's position relative to its parent.
      property draw_position : DrawPosition = DrawPosition::Absolute

      # How and when the entity (and its children) is updated.
      property update_mode : UpdateMode = UpdateMode::Inherit

      # Returns game object's extents (maximum dimensions)
      getter extents : Vector2 = Vector2.zero

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
          # Pass self in as a block so that we can apply any yield'ed callbacks to it.
          update(delta) { self }
        end
      end

      # Updates the entity.
      #
      # Updates are only applied if the `update_mode` allows it.
      def update(delta); end

      # Updates the entity with a block.
      #
      # Updates are only applied if the `update_mode` allows it.
      def update(delta, &)
        yield self
      end

      # Draws the entity and its children.
      #
      # This overrides `Entity#draw`.
      protected def _draw
        # Draws the children under the current entity.
        if @draw_children
          @children.each { |e| e._draw } unless draw_above_children
        end

        case @draw_position
        when .relative?
          # Draw relative to the parent.
          puts "SELF: #{self}"
          puts "PARENT: #{@parent}"

          if parent = @parent
            draw_at(parent.position + @position)
          else
            draw_at(@position)
          end
        else
          # Draw in an absolute position.
          draw
        end

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

      # Draws an entity at a specific position.
      def draw_at(position)
        draw
      end

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
        other.parent == self
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

      def can_update?
        case
        when @update_mode.disabled?
          return false
        else
          return true
        end
      end

      # Returns the entity's current position.
      def position
        @position
      end

      # Sets the entity's position.
      def position=(position)
        return if !can_update?
        @position = position
      end

      # Returns the entity's current rotation.
      def rotation
        @rotation
      end

      # Sets the entity's rotation.
      def rotation=(rotation)
        return if !can_update?
        @rotation = rotation
      end
    end
  end
end

require "./scene.cr"
require "./sprite.cr"

require "./control/control.cr"
require "./physics/physics_object.cr"
require "./shape/shape.cr"
