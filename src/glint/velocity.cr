module Glint
  # TODO
  struct Velocity
    @v : Vector2

    # Creates a new `Velocity`.
    def initialize(@v : Vector2); end

    # Creates a new `Velocity`.
    def initialize(x : Number, y : Number)
      @v = Vector2.new(x, y)
    end
  end
end

# Creates a new `Glint::Velocity` from a `Glint::Vector2`.
def vel(v : Glint::Vector2)
  Glint::Velocity.new(v)
end

# Creates a new `Glint::Velocity` x/y coordinates.
def vel(x : Number, y : Number)
  Glint::Velocity.new(x, y)
end
