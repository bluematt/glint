require "./entity.cr"

module Glint
  module Entity
    # A scene manages collections of entities.
    class Scene < Glint::Entity::Entity
      # The scene's background color.
      property background_color : Glint::Color?

      # Creates a new scene.
      def initialize; end

      # Creates a new scene with a specific background color.
      def initialize(@background_color); end
    end
  end
end

# Convenience alias for `Glint::Entity::Scene`.
alias Scene = Glint::Entity::Scene
