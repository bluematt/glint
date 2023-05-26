require "glint"

# Opens and window and draws some random rectangles.
class RectangleExample < Game
  # Set the game to be 800x600 and have an awesome title.
  #
  # We'll keep the defauly framerate (60fps).
  def initialize
    super(800, 600, "Rectangles Example")
    @display_fps = true
  end

  # Draw some shapes.
  def draw
    100.times do
      Rectangle.draw((1..400).sample, (1..300).sample, (1..400).sample, (1..300).sample, Color.random)
    end
  end
end

RectangleExample.new.run
