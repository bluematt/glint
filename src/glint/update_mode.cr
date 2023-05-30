module Glint
  # Determines if and how a game object is updated.
  enum UpdateMode
    # Inherits the `UpdateMode` of the parent game object.
    Inherit
    # Updates the game object (and its children) only when the `Game` is not paused.
    Pausable
    # Updates the game object (and its children) only when the `Game` is paused.
    WhenPaused
    # Always updates the game object (and its children).
    Always
    # Prevents the game object (and its children) from being updated.
    Disabled
  end
end

# Convenience alias for `Glint::UpdateMode`.
alias UpdateMode = Glint::UpdateMode
