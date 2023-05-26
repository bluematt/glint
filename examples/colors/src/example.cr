require "glint"

# Opens and window and displays some colored rectangles.
class SimpleLabelExample < Game
  # Set the game to be 800x600 and have an awesome title.
  #
  # We'll keep the defauly framerate (60fps).
  def initialize
    super(800, 600, "Colors Example")
    @display_fps = true
  end

  SIZE  = Dimension.new(370, 20)
  LEFT  =  20
  RIGHT = 410

  @@line = 20
  @@adjustment = 40

  # Draw coloured rectangles.
  def draw
    @@line = 20 # reset on each draw

    # Predefined color
    red = Color::RED
    Rectangle.draw(LEFT, @@line, SIZE, red)
    # Predefined color with an `#modulate` and block.
    Rectangle.draw(RIGHT, @@line, SIZE, red.modulate { |c| c.a = 127 }, 2, Color::WHITE)

    # Hex color string (6 bytes)
    Rectangle.draw(LEFT, @@line += @@adjustment, SIZE, Color.new("#00ff00"))
    # Hex color string (8 bytes, no "#")
    Rectangle.draw(RIGHT, @@line, SIZE, Color.new("00ff0080"))

    # Colours from tuples
    Rectangle.draw(LEFT, @@line += @@adjustment, SIZE, Color.new({0, 0, 255}))
    Rectangle.draw(RIGHT, @@line, SIZE, Color.new({0, 0, 255, 127}))
  end
end

SimpleLabelExample.new.run
