module Glint
  enum Origin
    TopLeft
    TopCenter
    TopRight
    MiddleLeft
    MiddleCenter
    MiddleRight
    BottomLeft
    BottomCenter
    BottomRight

    # Other (e.g. aliases)
    Center

    def offset
      case self
      when TopCenter
        return Vector2.new(0.5, 0)
      when TopRight
        return Vector2.new(1, 0)
      when MiddleLeft
        return Vector2.new(0, 0.5)
      when MiddleCenter, Center
        return Vector2.new(0.5, 0.5)
      when MiddleRight
        return Vector2.new(1, 0.5)
      when BottomLeft
        return Vector2.new(0, 1)
      when BottomCenter
        return Vector2.new(0.5, 1)
      when BottomRight
        return Vector2.new(1, 1)
      else
        return Vector2.new
      end
    end

    def from(extents : Vector2) : Vector2
      extents * offset
    end
  end
end

# Convenience alias for `Glint::Origin`.
alias Origin = Glint::Origin
