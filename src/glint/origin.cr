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
        return vec(0.5, 0)
      when TopRight
        return vec(1, 0)
      when MiddleLeft
        return vec(0, 0.5)
      when MiddleCenter, Center
        return vec(0.5, 0.5)
      when MiddleRight
        return vec(1, 0.5)
      when BottomLeft
        return vec(0, 1)
      when BottomCenter
        return vec(0.5, 1)
      when BottomRight
        return vec(1, 1)
      else
        return vec()
      end
    end

    def from(extents : Vector2) : Vector2
      extents * offset
    end
  end
end

# Convenience alias for `Glint::Origin`.
alias Origin = Glint::Origin
