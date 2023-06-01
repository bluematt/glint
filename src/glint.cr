require "raylib-cr"

# Glint is a simple 2d games programming library using Raylib.
module Glint
  VERSION = "0.1.0"

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

  enum Origin
    TopLeft
    TopCenter
    TopRight
    MiddleLeft
    MiddleCenter
    MiddleRight
    BottomLeft
    BottomCenter
    BottomRight

    # Other (e.g. aliases)
    Center

    def offset
      case self
      when TopCenter
        return Vector2.new(0.5, 0)
      when TopRight
        return Vector2.new(1, 0)
      when MiddleLeft
        return Vector2.new(0, 0.5)
      when MiddleCenter, Center
        return Vector2.new(0.5, 0.5)
      when MiddleRight
        return Vector2.new(1, 0.5)
      when BottomLeft
        return Vector2.new(0, 1)
      when BottomCenter
        return Vector2.new(0.5, 1)
      when BottomRight
        return Vector2.new(1, 1)
      else
        return Vector2.new
      end
    end

    def from(extents : Vector2) : Vector2
      extents * offset
    end
  end
end

require "./glint/number.cr"
require "./glint/vector2.cr"
require "./glint/color.cr"
require "./glint/texture.cr"

require "./glint/font.cr"
require "./glint/game.cr"
require "./glint/preload.cr"
require "./glint/random.cr"
require "./glint/rect.cr"
require "./glint/signal.cr"
require "./glint/tween.cr"
require "./glint/velocity.cr"
require "./glint/window.cr"
require "./glint/audio/audio.cr"
require "./glint/game_object/game_object.cr"
require "./glint/input/input.cr"
