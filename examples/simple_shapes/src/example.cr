require "glint"

alias Color = Glint::Color

# Opens and window and draws some simple shapes.
class SimpleShapesExample < Glint::Game
  def initialize
    super(800, 600, "Simple Shapes Example")
    @display_fps = true
  end

  # Draw some shapes.
  def draw
    # Blue circle with thick yellow outline at center of window
    Glint::Shape::Circle.draw(vec(400, 300), 50, Color::BLUE, 3, Color::YELLOW)
    # Green square with a thin white outline to right of the circle
    Glint::Shape::Rectangle.draw(vec(500, 200), vec(50, 200), Color::GREEN, 1, Color::WHITE)
    # Red line across the window.
    Glint::Shape::Line.draw(vec(100, 100), vec(700, 500), 4, color({255, 0, 0}))w
  end
end

SimpleShapesExample.new.run
