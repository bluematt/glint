module Glint
  module Input
    module Mouse
      # The mouse buttons.
      private BUTTONS = ["left", "right", "middle", "side", "extra", "forward", "back"]

      # The mouse button states.
      private STATES = ["pressed", "down", "released", "up"]

      # Mouse buttons
      enum Button
        {% for button in BUTTONS %}
          # The {{button.id}} `Mouse::Button`.
          {{button.id.stringify.capitalize.id}} = Raylib::MouseButton::{{button.id.stringify.capitalize.id}}
        {% end %}

        {% for action in STATES %}
          # Return whether the `Mouse::Button` is in the {{action.id}} state.
          def {{action.id}}?
            Raylib.mouse_button_{{action.id}}? self
          end
        {% end %}
      end

      # Return the x-coordinate of the the cursor position.
      def x : Int
        Raylib.get_mouse_x
      end

      # Return the y-coordinate of the the cursor position.
      def y : Int
        Raylib.get_mouse_y
      end

      # Return the cursor position.
      def position : Vector2
        vec(Raylib.get_mouse_x, Raylib.get_mouse_y)
      end

      {% for action in ["pressed", "down", "released", "up"] %}
        # Return whether `mouse_button` is in the {{action.id}} state.
        def self.{{action.id}}?(mouse_button : Button)
          mouse_button.{{action.id}}?
        end

        {% for button in Button.constants %}
          # Return whether `Mouse::Button::{{button.id}}` is in the {{action.id}} state.
          def self.{{button.id.stringify.downcase.id}}_{{action.id}}?
            Button::{{button.id}}.{{action.id}}?
          end
        {% end %}
      {% end %}
    end
  end
end

# Convenience alias to `Glint::Input::Mouse`.
alias Mouse = Glint::Input::Mouse
