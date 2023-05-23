module Glint
  # The window is responsible for managing and organising the `Game`'s visual presentation.
  class Window
    @title : String

    # Create a new `Window`.
    def initialize(height : Number, width : Number, @title : String)
      R.init_window(height, width, @title)
    end

    # :ditto:
    def initialize(size : Vector2, @title : String)
      R.init_window(size.x, size.y, @title)
    end

    # Returns the `Window`'s width.
    def width : Number
      R.get_screen_width
    end

    # Returns the `Window`'s height.
    def height : Number
      R.get_screen_height
    end

    # Returns the `Window`'s title.
    def title : String
      @title
    end

    # Sets the `Window`'s title.
    def title=(title : String)
      @title = title
      R.set_window_title(@title)
    end

    # Closes the `Window`.
    #
    # This also has the effect that it closes the `Game`.
    def close
      R.close_window
    end

    # Returns whether the `Window` should close.
    def close?
      R.close_window?
    end

    # Returns the coordinate at the center of the `Window`.
    def center : Vector2
      middle_center
    end

    # Returns the coordinate at the top left of the `Window`.
    def top_left : Vector2
      vec()
    end

    # Returns the coordinate at the top center of the `Window`.
    def top_center : Vector2
      vec(width/2, 0)
    end

    # Returns the coordinate at the top righr of the `Window`.
    def top_right : Vector2
      vec(width, 0)
    end

    # Returns the coordinate at the middle left of the `Window`.
    def middle_left : Vector2
      vec(0, height/2)
    end

    # Returns the coordinate at the middle centre of the `Window`.
    def middle_center : Vector2
      vec(width/2, height/2)
    end

    # Returns the coordinate at the middle right of the `Window`.
    def middle_right : Vector2
      vec(width, height/2)
    end

    # Returns the coordinate at the bottom left of the `Window`.
    def bottom_left : Vector2
      vec(0, height)
    end

    # Returns the coordinate at the bottom center of the `Window`.
    def bottom_center : Vector2
      vec(width/2, height)
    end

    # Returns the coordinate at the bottom right of the `Window`.
    def bottom_right : Vector2
      vec(width, height)
    end

    # Sets whether the `Window` is resizable.
    def resizable=(resizable)
      if resizable
        R.set_window_state(R::ConfigFlags::WindowResizable)
      else
        R.clear_window_state(R::ConfigFlags::WindowResizable)
      end
    end

    # Returns whether the `Window` is resizable.
    def resizable?
      R.window_state? R::ConfigFlags::WindowResizable
    end

    # Returns whether the `Window` is resized.
    def resized?
      R.window_resized?
    end

    # Returns whether the `Window` is focused.
    def focused?
      R.window_focused?
    end

    # Returns whether the `Window` is fullscreen.
    def fullscreen?
      R.window_fullscreen?
    end

    # Returns whether the `Window` is maximized.
    def maximized?
      R.window_maximized?
    end

    # Returns whether the `Window` is minimized.
    def minimized?
      R.window_minimized?
    end

    # Returns whether the `Window` is hidden.
    def hidden?
      R.window_hidden?
    end

    # Returns whether the `Window` is ready.
    def ready?
      R.window_ready?
    end

    # Toggles whether the `Window` is fullscreen.
    def toggle_fullscreen!
      R.toggle_fullscreen
    end

    # Restore the `Window`.
    def restore!
      R.restore_window
    end
  end
end

# Convenience alias for `Glint::Window`.
alias Window = Glint::Window
