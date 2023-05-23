struct Number
  # Convert a number (in radians) to degrees.
  def degrees
    return self * Raylib::RAD2DEG
  end

  # Convert a number (in degrees) to radians.
  def radians
    return self * Raylib::DEG2RAD
  end
end
