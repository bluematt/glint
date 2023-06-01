require "glint"

# Opens and window and draws some random rectangles.
class RectangleExample < Glint::Game
  def initialize
    super(800, 600, "Rectangle Example")
    @display_fps = true
  end

  def draw
    # Draw 100 randomly sized and colored rectangles per frame.
    100.times do
      Glint::Shape::Rectangle.draw((1..400).sample, (1..300).sample, (1..400).sample, (1..300).sample, Glint::Color.random)
    end
  end
end

RectangleExample.new.run
