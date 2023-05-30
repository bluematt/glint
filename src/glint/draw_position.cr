module Glint
  # Determines where a game object is drawn.
  enum DrawPosition
    # At an absolute position regardsless of where its parent is positioned.
    Absolute
    # At a position relative to it's parent.
    Relative
  end
end

# Convenience alias for `Glint::DrawPosition`.
alias DrawPosition = Glint::DrawPosition
