module Glint
  module Entity
    # A generic game object class.
    #
    # A game object is responsible for keeping track of it's own an child entities.
    abstract class GameObject
      # The game object's default position.
      DEFAULT_POSITION = Position.zero

      # The game object's default rotation, in degrees.
      DEFAULT_ROTATION = 0.0.degrees

      # The game object's default pivot.
      DEFAULT_ORIGIN = Origin::TopLeft

      # The game object's parent, if any.
      property parent : (GameObject | Game)?

      # Returns the child entities.
      getter children : Array(GameObject) = [] of GameObject

      # The game object's position.
      @position : Position = DEFAULT_POSITION

      # The game object's rotation.
      @rotation : Float64 = DEFAULT_ROTATION

      # The game object's point of transformation.
      property pivot : Origin = DEFAULT_ORIGIN

      # Whether the game object is visible or not.
      property visible : Bool = true

      # Whether to draw the game object's child game objects.
      property draw_children : Bool = true

      # Whether to draw the game object above its child game objects.
      property draw_above_children : Bool = false

      # The game object's position relative to its parent.
      property draw_position : DrawPosition = DrawPosition::Absolute

      # How and when the game object (and its children) is updated.
      property update_mode : UpdateMode = UpdateMode::Inherit

      # Returns game object's extents (maximum dimensions)
      getter extents : Dimension = Dimension.zero

      # Updates the game object and its child game object's.
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

      # Updates the game object.
      #
      # Updates are only applied if the `update_mode` allows it.
      def update(delta); end

      # Updates the game object with a block.
      #
      # Updates are only applied if the `update_mode` allows it.
      def update(delta, &)
        yield self
      end

      # Draws the game object and its children.
      #
      # This overrides `GameObject#draw`.
      protected def _draw
        # Draws the children under the current game object.
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

        # Draws the children above the current game object.
        if @draw_children
          @children.each { |e| e._draw } if draw_above_children
        end
      end

      # Draws the game object.
      #
      # This performs any drawing specific for *this* game object.  Any entities in
      # `@children` will be drawn automatically (if applicable).
      def draw; end

      # Draws a game object at a specific position.
      def draw_at(position)
        draw
      end

      # Add a game object to the game object's children for managing later.
      #
      # ```
      # class MyScene < Scene # Scene is a GameObject
      #   def initialize
      #     @spaceship = Spaceship.new
      #     self << @spaceship
      #   end
      # end
      # ```
      def <<(other : GameObject)
        other.parent == self
        @children << other
      end

      # Remove a game object from the game object's children, if it exists.
      #
      # ```
      # if health <= 0
      #   self.delete @spaceship
      # end
      # ```
      def delete(other : GameObject)
        @children.reject { |e| e == other }
      end

      # Returns whether the game object is in the children.
      def has?(other : GameObject)
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

      # Returns the game object's current position.
      def position
        @position
      end

      # Sets the game object's position.
      def position=(position)
        return if !can_update?
        @position = position
      end

      # Returns the game object's current rotation.
      def rotation
        @rotation
      end

      # Sets the game object's rotation.
      def rotation=(rotation)
        return if !can_update?
        @rotation = rotation
      end
    end
  end
end

# Convenience alias for `Glint::Entity::GameObject`.
alias GameObject = Glint::Entity::GameObject

require "./scene.cr"
require "./sprite.cr"

require "./control/control.cr"
require "./physics/physics_object.cr"
require "./shape/shape.cr"
