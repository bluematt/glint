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
