module Glint
  # Determines if and how an entity is updated.
  enum UpdateMode
    # Inherits the `UpdateMode` of the parent entity.
    Inherit
    # Updates the entity (and its children) only when the `Game` is not paused.
    Pausable
    # Updates the entity (and its children) only when the `Game` is paused.
    WhenPaused
    # Always updates the entity (and its children).
    Always
    # Prevents the entity (and its children) from being updated.
    Disable
  end
end

alias UpdateMode = Glint::UpdateMode
