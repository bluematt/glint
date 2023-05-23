struct Number
  # Convert a number (in radians) to degrees.
  def degrees
    return self * R::RAD2DEG
  end

  # Convert a number (in degrees) to radians.
  def radians
    return self * R::DEG2RAD
  end
end
