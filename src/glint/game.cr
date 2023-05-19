module Glint
  # The main game class.
  class Game
    DEFAULT_WIDTH  = 1920
    DEFAULT_HEIGHT = 1080
    DEFAULT_TITLE  = "<untitled>"
    DEFAULT_FPS    = 60

    # The game window.
    @window : Glint::Window

    # The current scene.
    @scene : Glint::Entity::Scene

    # The target_framerate
    @target_framerate = DEFAULT_FPS

    # Whether to display FPS.
    @display_fps = false

    # Create a new game with custom size, title and framerate.
    def initialize(width = DEFAULT_WIDTH, height = DEFAULT_HEIGHT, title = DEFAULT_TITLE, @target_framerate = DEFAULT_FPS)
      @window = Window.new(width, height, title)
      @scene = Glint::Entity::Scene.new
      @scene.background_color = Color::WHITE
      @scene << Label.new("Glint #{Glint::VERSION}", vec(width/2, height/2), 20, Color::WHITE)
    end

    # Run the game's mainloop: handle inputs, update game state, output.
    def run!
      framerate = @target_framerate

      Raylib.wait_time(0.01)
      delta = Raylib.get_frame_time

      until should_quit?
        _update!(delta) if delta > 0.0

        Raylib.begin_drawing
        _draw!
        Raylib.end_drawing

        delta = Raylib.get_frame_time
      end

      quit!
    end

    private def _update!(delta)
      if scene = @scene
        scene._update!(delta)
      end
      update!(delta)
    end

    # Update game state.
    def update!(delta); end

    private def _draw!
      if scene = @scene
        clear_background(scene.background_color)
        scene._draw!
      end
      draw!
      display_fps if @display_fps
    end

    # Clear the background to the specified color.
    def clear_background(color)
      Raylib.clear_background(color.to_raylib_color) if color
    end

    # Display the current FPS.
    #
    # TODO display this in the window, not the console.
    def display_fps
      puts framerate
    end

    # Draw game state.
    def draw!; end

    # Return whether the game should quit.
    def should_quit?
      Raylib.close_window?
    end

    # Quit the game.
    def quit!
      @window.close!
    end

    # Set the framerate.
    def framerate=(fps : UInt16)
      @target_framerate = fps
      Raylib.set_target_fps(@target_framerate)
    end

    # Get the target framerate.
    #
    # This may differ from the `framerate`.
    def target_framerate
      @target_framerate
    end

    # Get the current (real) framerate.
    #
    # This may differ from the `target_framerate`.
    def framerate
      Raylib.get_fps
    end
  end
end

alias Game = Glint::Game
