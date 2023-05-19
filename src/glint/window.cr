module Glint
  # The window is responsible for keeping track of the visual presentation.
  class Window
    @title : String

    # Create a new window.
    def initialize(height, width, @title)
      Raylib.init_window(height, width, @title)
    end

    # Get the window's width.
    def width
      Raylib.get_screen_width
    end

    # Get the window's height.
    def height
      Raylib.get_screen_height
    end

    # Get the window's title.
    def title
      @title
    end

    # Set the window's title.
    def title=(title)
      @title = title
      Raylib.set_window_title(@title)
    end

    def close!
      Raylib.close_window
    end

    def center
      vec(width/2, height/2)
    end

    def top_left
      vec()
    end

    def top_middle
      vec(width/2, 0)
    end

    def top_right
      vec(width, 0)
    end

    def resizable=(resizable)
      if resizable
        Raylib.set_window_state(Raylib::ConfigFlags::WindowResizable)
      else
        Raylib.clear_window_state(Raylib::ConfigFlags::WindowResizable)
      end
    end
  end
end
