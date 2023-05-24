module Glint
  module Input
    # Utility module for managing mouse-related features.
    module Mouse
      # The mouse buttons.
      private BUTTONS = ["left", "right", "middle", "side", "extra", "forward", "back"]

      # The mouse button states.
      private STATES = ["pressed", "down", "released", "up"]

      # Mouse buttons
      enum Button
        {% for button in BUTTONS %}
          # The {{button.id}} `Mouse::Button`.
          {{button.id.stringify.capitalize.id}} = R::MouseButton::{{button.id.stringify.capitalize.id}}
        {% end %}

        {% for action in STATES %}
          # Returns whether the `Mouse::Button` is in the {{action.id}} state.
          def {{action.id}}? : Bool
            R.mouse_button_{{action.id}}? self
          end
        {% end %}
      end

      # Returns the x-coordinate of the the cursor position.
      def self.x : Int
        R.get_mouse_x
      end

      # Returns the y-coordinate of the mouse position.
      def self.y : Int
        R.get_mouse_y
      end

      # Returns the mouse position.
      def self.position : Vector2
        Vector2.new(R.get_mouse_x, R.get_mouse_y)
      end

      {% for action in STATES %}
        # Returns whether `mouse_button` is in the {{action.id}} state.
        def self.{{action.id}}?(mouse_button : Button) : Bool
          mouse_button.{{action.id}}?
        end

        {% for button in Button.constants %}
          # Returns whether `Mouse::Button::{{button.id}}` is in the {{action.id}} state.
          def self.{{button.id.stringify.downcase.id}}_{{action.id}}? : Bool
            Button::{{button.id}}.{{action.id}}?
          end
        {% end %}
      {% end %}
    end
  end
end

# Convenience alias to `Glint::Input::Mouse`.
alias Mouse = Glint::Input::Mouse
