module Glint
  # The window is responsible for managing and organising the `Game`'s visual presentation.
  class Window
    @title : String

    # Create a new `Window` with width/height.
    def initialize(height : Number, width : Number, @title : String)
      Raylib.init_window(height, width, @title)
    end

    # Create a new `Window` with a `Dimension`.
    def initialize(size : Dimension, @title : String)
      Raylib.init_window(size.x, size.y, @title)
    end

    # Returns the `Window`'s width.
    def width : Number
      Raylib.get_screen_width
    end

    # Returns the `Window`'s height.
    def height : Number
      Raylib.get_screen_height
    end

    # Returns the `Window`'s title.
    def title : String
      @title
    end

    # Sets the `Window`'s title.
    def title=(title : String)
      @title = title
      Raylib.set_window_title(@title)
    end

    # Closes the `Window`.
    #
    # This also has the effect that it closes the `Game`.
    def close
      Raylib.close_window
    end

    # Returns whether the `Window` should close.
    def close?
      Raylib.close_window?
    end

    # Returns the coordinate at the center of the `Window`.
    def center : Position
      middle_center
    end

    # Returns the coordinate at the top left of the `Window`.
    def top_left : Position
      Position.new
    end

    # Returns the coordinate at the top center of the `Window`.
    def top_center : Position
      Position.new(width/2, 0)
    end

    # Returns the coordinate at the top righr of the `Window`.
    def top_right : Position
      Position.new(width, 0)
    end

    # Returns the coordinate at the middle left of the `Window`.
    def middle_left : Position
      Position.new(0, height/2)
    end

    # Returns the coordinate at the middle centre of the `Window`.
    def middle_center : Position
      Position.new(width/2, height/2)
    end

    # Returns the coordinate at the middle right of the `Window`.
    def middle_right : Position
      Position.new(width, height/2)
    end

    # Returns the coordinate at the bottom left of the `Window`.
    def bottom_left : Position
      Position.new(0, height)
    end

    # Returns the coordinate at the bottom center of the `Window`.
    def bottom_center : Position
      Position.new(width/2, height)
    end

    # Returns the coordinate at the bottom right of the `Window`.
    def bottom_right : Position
      Position.new(width, height)
    end

    # Sets whether the `Window` is resizable.
    def resizable=(resizable)
      if resizable
        Raylib.set_window_state(Raylib::ConfigFlags::WindowResizable)
      else
        Raylib.clear_window_state(Raylib::ConfigFlags::WindowResizable)
      end
    end

    # Returns whether the `Window` is resizable.
    def resizable?
      Raylib.window_state?(Raylib::ConfigFlags::WindowResizable)
    end

    # Returns whether the `Window` is resized.
    def resized?
      Raylib.window_resized?
    end

    # Returns whether the `Window` is focused.
    def focused?
      Raylib.window_focused?
    end

    # Returns whether the `Window` is fullscreen.
    def fullscreen?
      Raylib.window_fullscreen?
    end

    # Returns whether the `Window` is maximized.
    def maximized?
      Raylib.window_maximized?
    end

    # Returns whether the `Window` is minimized.
    def minimized?
      Raylib.window_minimized?
    end

    # Returns whether the `Window` is hidden.
    def hidden?
      Raylib.window_hidden?
    end

    # Returns whether the `Window` is ready.
    def ready?
      Raylib.window_ready?
    end

    # Toggles whether the `Window` is fullscreen.
    def toggle_fullscreen!
      Raylib.toggle_fullscreen
    end

    # Restore the `Window`.
    def restore!
      Raylib.restore_window
    end
  end
end
