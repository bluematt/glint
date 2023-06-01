require "glint"

# Opens and window and displays a simple label saying "Hello, World!".
class SimpleLabelExample < Glint::Game
  def initialize
    super(800, 600, "Simple Label Example")
  end

  def draw
    Glint::Label.draw("Hello, World!", color: Glint::Color::YELLOW)
  end
end

SimpleLabelExample.new.run
