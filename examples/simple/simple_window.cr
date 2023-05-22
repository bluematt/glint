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
    # How much time has elapsed.
    @elapsed = 0.0

    # Set up the "game".
    def initialize
      super(800, 600, "Raylib logo")
      @display_fps = true
      @scene = Scene.new(Color::WHITE)

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

    # Rotate the icon by 30° every second (using *delta*), and change the label color.
    #
    # We use a block (see https://crystal-lang.org/reference/latest/syntax_and_semantics/blocks_and_procs.html)
    # here to create a pseudo-`update` method that doesn't require us to subclass
    # `Sprite` and create an `update` method for it.
    def update(delta)
      per_frame_rotation = 30 * delta

      # Long form, do the first 15° of the rotation.
      @icon.update(delta) do |entity|
        entity.rotation += per_frame_rotation / 2
      end

      # Short form, do the other 15° of the rotation.
      @icon.update(delta) { |e| e.rotation += per_frame_rotation / 2 }

      # Change the color once every second.
      @elapsed += delta
      if @elapsed > 1.0
        @elapsed = @elapsed - 1
        @label.color = Color.random
      end
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
