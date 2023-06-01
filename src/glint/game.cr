module Glint
  # The main game class.
  #
  # Extend `Game` with `draw` and `update(delta : Float)` methods to create
  # simple games, or use the `Scene` class to create more complex games.
  class Game
    # The game `Window`.
    getter window : Window

    # The current `Scene`.
    getter scene : Scene

    # The game's absolute position.
    @position : Position = Position.zero

    # Whether to display FPS.
    @display_fps : Bool = false

    # The position of the FPS label.
    @fps_position : Position = Position.new(8, 8)

    # The target (maximum ideal) framerate.
    property target_framerate : Int32 = 60

    # Whether the game is paused.
    @paused : Bool = false

    {% if flag?(:release) %}
      @log_level = LogLevel::Fatal
    {% else %}
      @log_level = LogLevel::All
    {% end %}

    # Creates a new game with optional size, title and framerate.
    #
    def initialize(width = 1920.pixels, height = 1080.pixels, title = "<untitled>", @target_framerate = 60)
      Raylib.set_trace_log_level(@log_level)

      @window = Window.new(width, height, title)
      @scene = Scene.new(Color::BLACK)
    end

    # Runs the game's mainloop: handle inputs, update game state, output.
    def run
      Raylib.set_target_fps(@target_framerate)

      # Perform a small wait.
      Raylib.wait_time(0.0000001)
      delta = Game.frame_time

      until should_quit?
        _update(delta)

        Raylib.begin_drawing
        _draw
        Raylib.end_drawing

        Raylib.set_target_fps(@target_framerate)

        delta = Game.frame_time
      end

      quit
    end

    # Updates the current game and the `Scene`.
    private def _update(delta : Float)
      if scene = @scene
        scene._update(delta)
      end
      update(delta)
    end

    # Performs custom updates.
    def update(delta : Float); end

    # Draws the current game.
    private def _draw
      if scene = @scene
        Game.clear_background(scene.background_color)
        scene._draw
      end
      draw
      display_fps_text if @display_fps
    end

    # Performs custom drawing.
    #
    # Overload this method to draw directly, bypassing the automatic drawing of `Scene`s
    # (`Scene`s are still drawn, if they have anything to draw...).
    #
    # By default, it shows a simple label displaying the name and version of the Glint library.
    # If you don't want to see this, simple override the `Game#draw` method, even if it's
    # empty:
    #
    # ```
    # class MyGame < Game
    #   def draw; end
    # end
    #
    # # or even this, if you're feeling feisty:
    #
    # class Game
    #   def draw; end
    # end
    # ```
    def draw
      label = Label.new "Glint v.#{Glint::VERSION} | Raylib v.#{Raylib::VERSION}", @window.center, color: Color::WHITE
      label.pivot = Origin::Center
      label.draw
    end

    # Clears the background to the specified color.
    def self.clear_background(color : Color?)
      Raylib.clear_background(color) if color
    end

    # Display the current FPS.
    def display_fps_text
      Raylib.draw_fps(@fps_position.x, @fps_position.y)
    end

    # Returns whether the game should quit.
    def should_quit?
      @window.close?
    end

    # Quits the game.
    def quit
      @window.close
    end

    # Returns the current (real) framerate.
    #
    # This may differ from the `target_framerate`.
    def self.framerate
      Raylib.get_fps
    end

    # :ditto:
    def framerate
      Game.framerate
    end

    # Returns the duration (in seconds) since the last frame.
    def self.frame_time
      Raylib.get_frame_time
    end

    # :ditto:
    def frame_time
      Game.frame_time
    end

    # Returns the FPS label's position.
    def fps_position
      @fps_position
    end

    # Sets the FPS label's position.
    def fps_position=(position : Position)
      @fps_position = position
    end

    # Sets the trace log level.
    def log_level=(log_level : LogLevel)
      @log_level = log_level
      Raylib.set_trace_log_level(@log_level)
    end

    # Returns the trace log level.
    def log_level
      @log_level
    end

    # Sets whether the game is paused.
    def paused=(paused)
      @paused = paused
    end

    # Returns whether the game is paused.
    def paused?
      @paused
    end

    # Pause the game.
    def pause!
      @paused = true
    end

    # Unpause the game.
    def unpause!
      @paused = false
    end

    # Returns the game's absolute position.
    def position
      @position
    end

    # Sets the scene.
    def scene=(scene : Entity::Scene)
      @scene = scene
      # Create a reference to the `Game` itself.
      @scene.game = self
    end
  end
end
