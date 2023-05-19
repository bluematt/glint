require "../../src/glint.cr"

module Examples
  # A simple window example.
  #
  # This example displays a single rotating sprite in the middle of the game window.
  class SimpleWindowExample < Game
    # A sprite.
    @icon : Sprite
    # A label.
    @label : Label

    # Set up the "game".
    def initialize
      super(800, 600, "Raylib logo", 60)
      @display_fps = true
      # @scene = Scene.new(Color::WHITE)

      # The icon will be added to the default scene.  We will not need to
      # tell this to be drawn later.
      @icon = Sprite.preload("./Raylib_logo.png")
      @icon.position = @window.center
      @icon.pivot = Origin::Center
      @scene << @icon

      # The label, on the other hand, is not added to the scene, therefore
      # it will need to be drawn manually by calling it's `draw` method in the
      # `Game::draw` method.
      @label = Label.new("This is Glint v.#{Glint::VERSION}!", @window.bottom_center, color: Color::BLACK)
      @label.pivot = Origin::BottomCenter
    end

    # Rotate the icon by 15° every second (using *delta*).
    #
    # TODO Randomise label color
    def update(delta)
      @icon.rotation += 15 * delta
    end

    # Draw stuff.
    #
    # We don't need to explicitly `draw` the `@icon` as it's part of the default `Scene`,
    # `@scene`.  `Scene`s and their contents are automatically drawn (if they are not hidden).
    def draw
      # @icon.draw
      @label.draw
    end
  end
end

game = Examples::SimpleWindowExample.new
game.run
