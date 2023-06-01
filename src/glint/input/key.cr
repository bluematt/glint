module Glint
  module Input
    module Keyboard
      # The keyboard keys.
      private KEYS = [
        :null, :apostrophe, :comma, :minus, :period, :slash,
        :zero, :one, :two, :three, :four, :five, :six, :seven, :eight, :nine,
        :semicolon, :equal,
        :a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :k, :l, :m, :n, :o, :p, :q, :r, :s, :t, :u, :v, :w, :x, :y, :z,
        :left_bracket, :backslash, :right_bracket, :grave, :space, :enter, :tab, :backspace, :insert, :delete,
        :right, :left, :down, :up, :page_up, :page_down, :home, :end,
        :caps_lock, :scroll_lock, :num_lock, :print_screen, :pause,
        :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12,
        :left_shift, :left_control, :left_alt, :left_super, :right_shift, :right_control, :right_alt, :right_super,
        :kb_menu, :kp0, :kp1, :kp2, :kp3, :kp4, :kp5, :kp6, :kp7, :kp8, :kp9,
        :kp_decimal, :kp_divide, :kp_multiply, :kp_subtract, :kp_add, :kp_enter, :kp_equal,
        :back, :menu, :volume_up, :volume_down,
      ]

      # The key states.
      # private STATES = [:pressed, :down, :released, :up]

      enum Key
        {% for k in KEYS %}
          # The {{ k.id.stringify.camelcase.id }} key.
          # ```
          # {{ k.id.stringify.camelcase.id }} = Raylib::KeyboardKey::{{ k.id.stringify.camelcase.id }}
          # ```
          {{ k.id.stringify.camelcase.id }} = Raylib::KeyboardKey::{{ k.id.stringify.camelcase.id }}
        {% end %}

        {% for action in STATES %}
          # Returns whether the `Key` is in the {{action.id}} state.
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

      {% for action in STATES %}
        # Returns whether `mouse_button` is in the {{action.id}} state.
        #
        # ```
        # def self.{{action.id}}?(key : Key) : Bool
        #   key.is_{{action.id}}?
        # end
        # ```
        def self.{{action.id}}?(key : Key) : Bool
          key.is_{{action.id}}?
        end

        {% for k in KEYS %}
          # Returns whether `Key::{{k.id.stringify.camelcase.id}}` is in the {{action.id}} state.
          #
          # ```
          # def self.{{k.id.stringify.downcase.id}}_{{action.id}}? : Bool
          #   Key::{{k.id.stringify.camelcase.id}}.is_{{action.id}}?
          # end
          # ```
          def self.{{k.id.stringify.downcase.id}}_{{action.id}}? : Bool
            Key::{{k.id.stringify.camelcase.id}}.is_{{action.id}}?
          end
        {% end %}
      {% end %}
    end
  end
end
