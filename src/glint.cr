require "raylib-cr"

# Glint is a simple 2d games programming library using Raylib.
module Glint
  VERSION = "0.1.0"
end

# Alias for `Raylib::TraceLogLevel`.
#
# Use `Glint::Game#log_level=` to set the log level.
#
# By default, the log level is `Fatal` for `--release`, otherwise `All`.
enum LogLevel
  All     = Raylib::TraceLogLevel::All
  Trace   = Raylib::TraceLogLevel::Trace
  Debug   = Raylib::TraceLogLevel::Debug
  Info    = Raylib::TraceLogLevel::Info
  Warning = Raylib::TraceLogLevel::Warning
  Error   = Raylib::TraceLogLevel::Error
  Fatal   = Raylib::TraceLogLevel::Fatal
end

require "./glint/value_error.cr"

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
require "./glint/entity/game_object.cr"
require "./glint/input/input.cr"
