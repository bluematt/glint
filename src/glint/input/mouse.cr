module Glint
  module Input
    # Utility module for managing mouse-related features.
    module Mouse
      # The mouse buttons.
      private BUTTONS = [:left, :right, :middle, :side, :extra, :forward, :back]

      # The mouse button states.
      private STATES = [:pressed, :down, :released, :up]

      # Mouse buttons
      enum Button
        {% for button in BUTTONS %}
          # The {{button.id}} `Mouse::Button`.
          #
          # ```
          # {{button.id.stringify.capitalize.id}} = Raylib::MouseButton::{{button.id.stringify.capitalize.id}}
          # ```
          {{button.id.stringify.capitalize.id}} = Raylib::MouseButton::{{button.id.stringify.capitalize.id}}
        {% end %}

        {% for action in STATES %}
          # Returns whether the `Mouse::Button` is in the {{action.id}} state.
          #
          # ```
          # def is_{{action.id}}? : Bool
          #   Raylib.key_{{action.id}}? self
          # end
          # ```
          def is_{{action.id}}? : Bool
            Raylib.key_{{action.id}}? self
          end
        {% end %}
      end

      # Returns the x-coordinate of the the cursor position.
      def self.x : Int
        Raylib.get_mouse_x
      end

      # Returns the y-coordinate of the mouse position.
      def self.y : Int
        Raylib.get_mouse_y
      end

      # Returns the mouse position.
      def self.position : Position
        Position.new(Raylib.get_mouse_x, Raylib.get_mouse_y)
      end

      {% for action in STATES %}
        # Returns whether `mouse_button` is in the {{action.id}} state.
        #
        # ```
        # def self.{{action.id}}?(mouse_button : Button) : Bool
        #   mouse_button.is_{{action.id}}?
        # end
        # ```
        def self.{{action.id}}?(mouse_button : Button) : Bool
          mouse_button.is_{{action.id}}?
        end

        {% for button in Button.constants %}
          # Returns whether `Mouse::Button::{{button.id}}` is in the {{action.id}} state.
          #
          # ```
          # def self.{{button.id.stringify.downcase.id}}_{{action.id}}? : Bool
          #   Button::{{button.id}}.is_{{action.id}}?
          # end
          # ```
          def self.{{button.id.stringify.downcase.id}}_{{action.id}}? : Bool
            Button::{{button.id}}.is_{{action.id}}?
          end
        {% end %}
      {% end %}
    end
  end
end

# Convenience alias to `Glint::Input::Mouse`.
alias Mouse = Glint::Input::Mouse
