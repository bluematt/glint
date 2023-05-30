module Glint
  module Input
    module Controller
      # The controller buttons.
      private BUTTONS = [
        :unknown,
        :left_face_up, :left_face_right, :left_face_down, :left_face_left,
        :right_face_up, :right_face_right, :right_face_down, :right_face_left,
        :left_trigger_1, :left_trigger_2,
        :right_trigger_1, :right_trigger_2,
        :middle_left, :middle, :middle_right,
        :left_thumb, :right_thumb,
      ]

      # The button states.
      private STATES = [:pressed, :down, :released, :up]

      private AXES = [
        :left_x, :left_y,
        :right_x, :right_y,
        :left_trigger, :right_trigger,
      ]

      enum Button
        {% for button in BUTTONS %}
          # The {{button.id.stringify.camelcase.id}} `Controller::Button`.
          # ```
          # {{button.id.stringify.camelcase.id}} = Raylib::GamepadButton::{{button.id.stringify.camelcase.id}}
          # ```
          {{button.id.stringify.camelcase.id}} = Raylib::GamepadButton::{{button.id.stringify.camelcase.id}}
        {% end %}

        {% for action in STATES %}
        # Returns whether the `Controller::Button` is in the {{action.id}} state.
        #
        # ```
        # def is_{{action.id}}?(gamepad) : Bool
        #   Raylib.gamepage_button_{{action.id}}? gamepad, self
        # end
        # ```
        def is_{{action.id}}?(gamepad) : Bool
          Raylib.gamepage_button_{{action.id}}? gamepad, self
        end
        {% end %}
      end

      class Controller
        def self.available?(id)
          Raylib.gamepad_available?(id)
        end

        @id : Int32

        def initialize(@id); end

        # Returns whether the controller is available.
        def available?
          Controller.available? @id
        end

        {% for action in STATES %}
        # Returns whether the `Controller::Button` is in the {{action.id}} state.
        #
        # ```
        # def is_{{action.id}}?(button : Button) : Bool
        #   return false unless available?
        #   button.is_{{action.id}}? @id
        # end
        # ```
        def is_{{action.id}}?(button : Button) : Bool
          return false unless available?
          button.is_{{action.id}}? @id
        end
        {% end %}

        {% for button in BUTTONS %}
        {% for action in STATES %}
        # Returns whether the `Button::{{button.id.stringify.camelcase.id}}` is in the {{action.id}} state.
        #
        # ```
        # def is_{{button.id}}_{{action.id}}?
        #   return false unless available?
        #   Button::{{button.id.stringify.camelcase.id}}.is_{{action.id}}? self
        # end
        # ```
        def is_{{button.id}}_{{action.id}}?
          return false unless available?
          Button::{{button.id.stringify.camelcase.id}}.is_{{action.id}}? self
        end
        {% end %}
        {% end %}

        # Returns the `Controller`'s id.
        def id
          @id
        end
      end
    end
  end
end

# Convenience alias for `Glint::Input::Controller`.
alias Controller = Glint::Input::Controller
