require "glint"

# Opens and window and draws some simple shapes.
class SimpleDrawingExample < Game
  # Set the game to be 800x600 and have an awesome title.
  #
  # We'll keep the defauly framerate (60fps).
  def initialize
    super(800, 600, "Simple Shapes Example")
    @display_fps = true
  end

  # Draw some shapes.
  def draw
    # Red line frmo top left to the center of the window
    Line.draw(vec(0, 0), vec(400, 300), 4, color({255, 0, 0}))
    # Blue circle with thick yellow outline at center of window
    Circle.draw(vec(400, 300), 50, Color::BLUE, 3, Color::YELLOW)
    # Green square with a thin white outline to right of the circle
    Square.draw(vec(500, 300), vec(100, 100), Color::GREEN, 1, Color::WHITE)
  end
end

SimpleDrawingExample.new.run
