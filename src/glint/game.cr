module Glint
  # The main game class.
  #
  # Extend the `Game` class with your own `draw` and `update(delta : Float)` methods
  # to create simple games, or use the `Scene` class to create more complex games.
  class Game
    DEFAULT_WIDTH     = 1920
    DEFAULT_HEIGHT    = 1080
    DEFAULT_TITLE     = "<untitled>"
    DEFAULT_FRAMERATE = 60

    # The game `Window`.
    @window : Window

    # The current `Scene`.
    @scene : Scene

    # The target (maximum ideal) framerate.
    property target_framerate : Int32 = DEFAULT_FRAMERATE

    # Whether to display FPS.
    property display_fps : Bool = false

    # Creates a new game with optional size, title and framerate.
    def initialize(width = DEFAULT_WIDTH, height = DEFAULT_HEIGHT, title = DEFAULT_TITLE, @target_framerate = DEFAULT_FRAMERATE)
      @window = Window.new(width, height, title)
      @scene = Scene.new(Color::BLACK)
    end

    # Runs the game's mainloop: handle inputs, update game state, output.
    def run
      Raylib.set_target_fps(@target_framerate)

      Raylib.wait_time(0.0000001)
      delta = Game.frame_time

      until should_quit?
        _update(delta) if delta > 0.0

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
      display_fps if @display_fps
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
    # ```crystal
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
      label = Label.new "Glint v.#{Glint::VERSION}!", @window.center, color: Color::WHITE
      label.pivot = Origin::Center
      label.draw
    end

    # Clears the background to the specified color.
    def self.clear_background(color : Color?)
      Raylib.clear_background(color.to_raylib) if color
    end

    # Display the current FPS.
    def display_fps
      Raylib.draw_fps(8, 8)
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
    def framerate
      Raylib.get_fps
    end

    # Returns the duration (in seconds) since the last frame.
    def self.frame_time
      Raylib.get_frame_time
    end
  end
end

alias Game = Glint::Game
