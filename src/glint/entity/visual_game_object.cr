module Glint
  module Entity
    abstract class VisualGameObject < GameObject
      # The game object's position.
      property position : Vector2 = Vector2.new

      # The game object's rotation.
      property rotation : Float32 = 0.0

      # The game object's point of transformation.
      property pivot : Origin = Origin::TopLeft

      # The game object's extents (maximum dimensions)
      property extents : Vector2 = vec()
    end
  end
end
