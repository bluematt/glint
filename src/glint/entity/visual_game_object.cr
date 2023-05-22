module Glint
  module Entity
    # A visual game object that will appear on screen.
    abstract class VisualGameObject < GameObject
      # The entity's default position.
      DEFAULT_POSITION = vec()

      # The entity's default rotation, in degrees.
      DEFAULT_ROTATION = 0.0

      # The entity's default pivot.
      DEFAULT_ORIGIN = Origin::TopLeft

      # The entity's position.
      property position : Vector2 = DEFAULT_POSITION

      # The entity's position relative to its parent.
      property draw_position : DrawPosition = DrawPosition::Absolute

      # The entity's rotation.
      property rotation = DEFAULT_ROTATION

      # The entity's point of transformation.
      property pivot : Origin = DEFAULT_ORIGIN

      # Returns game object's extents (maximum dimensions)
      getter extents : Vector2 = vec()

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
          draw_at(@position)
        else
          # Draw in an absolute position.
          draw
        end

        # Draws the children above the current entity.
        if @draw_children
          @children.each { |e| e._draw } if draw_above_children
        end
      end

      def draw_at(position); end
    end
  end
end
