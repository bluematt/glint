struct Number
  # Returns an angle (assumed in radians) converted to degrees.
  @[AlwaysInline]
  def to_degrees
    return self * Raylib::RAD2DEG
  end

  # Returns an angle (assumed in degrees) converted to radians.
  @[AlwaysInline]
  def to_radians
    return self * Raylib::DEG2RAD
  end

  # Returns a number annotated as pixels.
  #
  # ```
  # Example:
  # self.position.x += 24.pixels # Shift the x position of the entity by 24 pixels.
  # ```
  @[AlwaysInline]
  def pixels
    self
  end

  # Returns a number annotated as frames per second.
  #
  # ```
  # Example:
  # Game.target_framerate = 30.fps
  # ```
  @[AlwaysInline]
  def fps
    self
  end

  # Returns a number as an angle, annotated as degrees.
  @[AlwaysInline]
  def degrees
    self
  end

  # Returns a number as an angle, annotated as radians.
  @[AlwaysInline]
  def radians
    self
  end
end
