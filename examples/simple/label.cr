require "../../src/glint.cr"

class MyGame < Game
  # Set the game to be 800x600 and have an awesome title.
  #
  # We'll keep the defauly framerate (60fps).
  def initialize
    super(800, 600, "My Awesome Game")
  end

  # Draw a simple label.
  def draw
    Label.draw("Hello, World!")
  end
end

MyGame.new.run
