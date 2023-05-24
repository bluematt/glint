struct Number
  # Convert a number (in radians) to degrees.
  def degrees
    return self * Glint::R::DEG2RAD
  end

  # Convert a number (in degrees) to radians.
  def radians
    return self * Glint::R::RAD2DEG
  end
end
