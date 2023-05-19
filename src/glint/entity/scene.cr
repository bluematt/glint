require "./entity.cr"

module Glint
  module Entity
    # A scene manages collections of entities.
    class Scene < Glint::Entity::Entity
      # The scene's background color.
      property background_color : Glint::Color?

      def initialize; end

      def initialize(@background_color); end
    end
  end
end

alias Scene = Glint::Entity::Scene
