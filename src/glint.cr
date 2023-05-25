require "raylib-cr"

# Glint is a simple 2d games programming library using Raylib.
module Glint
  VERSION = "0.1.0"

  # Internal alias for the Raylib library.
  alias R = Raylib
end

require "./glint/number.cr"
require "./glint/vector2.cr"
require "./glint/color.cr"

require "./glint/cursor.cr"
require "./glint/draw_position.cr"
require "./glint/font.cr"
require "./glint/game.cr"
require "./glint/origin.cr"
require "./glint/preload.cr"
require "./glint/random.cr"
require "./glint/rect.cr"
require "./glint/signal.cr"
require "./glint/tween.cr"
require "./glint/update_mode.cr"
require "./glint/velocity.cr"
require "./glint/window.cr"
require "./glint/audio/audio.cr"
require "./glint/entity/entity.cr"
require "./glint/input/input.cr"

alias Position = Vector2
