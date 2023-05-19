require "../../src/glint.cr"

module Examples
  class SimpleWindowExample < Game
    @icon : Sprite

    def initialize
      super(800, 600, "Raylib logo", 60)
      # @display_fps = true
      @icon = Sprite.preload("./Raylib_logo.png")
      # @icon = Glint::Entity::Sprite.preload("./Crystal_lang_logo.gif")
      @icon.position = @window.center
      @icon.pivot = Glint::Origin::MiddleCenter
    end

    def draw
      @icon.draw
    end
  end
end

game = Examples::SimpleWindowExample.new
game.run
