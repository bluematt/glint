require "../../src/glint.cr"

class MyGame < Game
  def initialize
    super(800, 600, "My Awesome Game")
  end

  def draw
    Label.draw("Hello, World!")
  end
end

MyGame.new.run
