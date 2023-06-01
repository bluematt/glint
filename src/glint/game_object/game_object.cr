module Glint
  # A generic game object class.
  #
  # A game object is responsible for keeping track of it's own an child entities.
  abstract class GameObject
    # Determines where a game object is drawn.
    enum DrawPosition
      # At an absolute position regardsless of where its parent is positioned.
      Absolute
      # At a position relative to it's parent.
      Relative
    end

    # Determines if and how a game object is updated.
    enum UpdateMode
      # Inherits the `UpdateMode` of the parent game object.
      Inherit
      # Updates the game object (and its children) only when the `Game` is not paused.
      Pausable
      # Updates the game object (and its children) only when the `Game` is paused.
      WhenPaused
      # Always updates the game object (and its children).
      Always
      # Prevents the game object (and its children) from being updated.
      Disabled
    end

    # The game object's parent, if any.
    property parent : (GameObject | Game)?

    # Returns the child entities.
    getter children : Array(GameObject) = [] of GameObject

    # The `Game` object.
    #
    # This is a reference to the current base `Game` to allow for changes,
    # *e.g.* to pause the game or get the game's `Window` size.
    property game : Game?

    # The game object's position.
    @position : Position = Position.new

    # The game object's rotation.
    @rotation : Float64 = 0.0.degrees

    # The game object's point of transformation.
    property pivot : Origin = Origin::TopLeft

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
        # Spawn a fiber for each update cycle.  This will spawn a fiber for each
        # subsequent update.
        spawn do
          @children.each do |e|
            e._update(delta)
          end
          # Pass self in as a block so that we can apply any yield'ed callbacks to it.
          update(delta) { self }
        end
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
      other.game = @game
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

require "./scene.cr"
require "./sprite.cr"
require "./control/control.cr"
require "./physics/physics.cr"
require "./shape/shape.cr"
require "./pixel.cr"
