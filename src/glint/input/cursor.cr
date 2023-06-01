module Glint
  module Input
    module Mouse
      # Utility module for managing cursor-related features.
      module Cursor
        # Shows the cursor.
        def self.show
          Raylib.show_cursor
        end

        # Hides the cursor.
        def self.hide
          Raylib.hide_cursor
        end

        # Returns whether the cursor is hidden.
        def self.hidden? : Bool
          Raylib.cursor_hidden?
        end

        # Returns whether the cursor is visible.
        def self.visible? : Bool
          !Cursor.hidden?
        end

        # Enables the cursor.
        def self.enable
          Raylib.enable_cursor
        end

        # Disables the cursor.
        def self.disable
          Raylib.disable_cursor
        end

        # Returns whether the cursor is on the screen.
        def self.on_screen? : Bool
          Raylib.cursor_on_screen?
        end

        # Returns the position of the cursor on the screen.
        #
        # Alias for `Mouse.position`.
        def self.position : Position
          Mouse.position
        end

        # Returns the x-position of the cursor on the screen.
        #
        # Alias for `Mouse.x`.
        def self.x : Number
          Mouse.x
        end

        # Returns the y-position of the cursor on the screen.
        #
        # Alias for `Mouse.y`.
        def self.y : Number
          Mouse.y
        end
      end
    end
  end
end
