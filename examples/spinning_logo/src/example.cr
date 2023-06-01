require "glint"

module Examples
  # Displays a single rotating sprite of the Raylib logo which
  # changes color once per second in the middle of the game window.
  class SimpleWindowExample < Glint::Game
    # A sprite.
    @icon : Glint::Sprite

    # A label.
    @label : Glint::Label

    # How much time has elapsed.
    @elapsed = 0.0

    # Set up the "game".
    #
    # This sets the window size, sets the title and allows the FPS to be displayed.
    # We then create a new Scene with a plain RayWhite background.
    #
    # Then we create two entities: a `Sprite` which displays a spinning logo, and a
    # label which displays the current `Glint::VERSION`.
    def initialize
      super(800, 600, "Raylib logo")
      @display_fps = true
      @scene = Glint::Scene.new(Glint::Color::RAYWHITE)

      # The icon will be added to the default scene.  We will not need to
      # tell this to be drawn later.
      @icon = Glint::Sprite.new("./assets/Raylib_logo.png")
      @icon.position = @window.center
      @icon.pivot = Glint::Origin::Center
      @scene << @icon

      # The label, on the other hand, is not added to the scene, therefore
      # it will need to be drawn manually by calling it's `draw` method in the
      # `Game::draw` method.
      @label = Glint::Label.new("This is Glint v.#{Glint::VERSION}!", @window.bottom_center, color: Glint::Color::BLACK)
      @label.pivot = Glint::Origin::BottomCenter
    end

    # Rotate the `@icon` by 30° every second (using *delta*), and change the
    # color of the `@label` and the `@icon`.
    #
    # We use a [block](https://crystal-lang.org/reference/latest/syntax_and_semantics/blocks_and_procs.html)
    # to create a pseudo-`update` method on `@icon` that doesn't require us to
    # subclass `Sprite` and create an `update` method for it.
    def update(delta)
      # Each frame rotate by 30°.
      per_frame_rotation = 30 * delta
      half_rotation = per_frame_rotation / 2

      # Change the color once every second.
      @elapsed += delta
      if @elapsed > 1.0
        @elapsed = @elapsed - 1
        random_color = Glint::Color.random
        @icon.tint = random_color
        @label.color = random_color
      end

      # Long form, do the first half of the rotation.
      @icon.update(delta) do |entity|
        entity.rotation += half_rotation
      end

      # Short form, do the other half of the rotation.
      @icon.update(delta) { |e| e.rotation += half_rotation }
    end

    # Draw stuff.
    #
    # We don't need to explicitly `draw` the `@icon` as it's part of the default `Scene`,
    # `@scene`.  `Scene`s and their contents are automatically drawn (if they are not hidden).
    #
    # **Note**: Because `@label` is *not* a child of `@scene`, it will not be automatically drawn
    # or updated.  In this case, as it doesn't change, it doesn't need a manual `update`, but it
    # still needs to be `draw`n.
    def draw
      @label.draw
    end
  end
end

game = Examples::SimpleWindowExample.new
game.run
