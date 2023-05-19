require "../../src/glint.cr"

# Opens a 800x600 game window, and does nothing else
# except display the default `Scene` which shows the current `Glint::VERSION`.
Game.new(800, 600).run
