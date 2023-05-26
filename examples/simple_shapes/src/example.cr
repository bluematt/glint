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
    Line.draw(vec(200, 200), vec(300, 200), 4, color({0, 0, 255}))
    Line.draw(vec(35, 50), vec(300, 200), 4, color({0, 0, 255, 128}))
    # Line.draw(vec(100, 100), vec(300, 200), 4, color("ff0000"))
    # Line.draw(vec(300, 100), vec(100, 200), 4, color(0xf0ff00ffcc))
    # Circle.draw(vec(300, 300), 50, Color::BLUE, 1, Color::DARKBLUE)
    # Circle.draw(vec(200, 300), 50, color("#ff0000ff"))
    # Circle.draw(vec(300, 300), 50, color("#ff0000"))
    # Circle.draw(vec(400, 300), 50, color("#ff000080"))
    # Circle.draw(vec(200, 200), 50, color("#ffccccff"))
    # Circle.draw(vec(300, 200), 50, color("#ffcccc"))
    # Circle.draw(vec(400, 200), 50, color("#ffcccc80"))
    # Circle.draw(vec(250, 250), 20, color("f00"), 1, Color::WHITE, OutlinePosition::Inside)
    # Circle.draw(vec(300, 300), 20, Color::BLUE, 1, Color::DARKBLUE, OutlinePosition::Outside)
    # Circle.disc(vec(50, 50), 25)
    # Circle.outline(vec(150, 150), 25)
    # Circle.draw(vec(25, 250), 10, outline: 5, outline_position: OutlinePosition::Outside)
  end
end

SimpleDrawingExample.new.run
