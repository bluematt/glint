module Glint
  # Generate random numbers.
  module Random
    private MAX = Int128.MAX

    # Return a random float value between 0..1 (inclusive).
    def self.value
      Raylib.get_random_value(0, MAX) / MAX
    end

    # Return a random integer value between 0..`a` (inclusive).
    def self.up_to(a : Int32)
      Raylib.get_random_value(0, a)
    end

    # Return a random integer value between `a`..`b` (inclusive).
    def self.between(a : Int32, b : Int32)
      Raylib.get_random_value(a, b)
    end

    # Set the seed for the random number generator.
    def self.seed=(seed : Int32)
      Raylib.set_random_seed(seed)
    end
  end
end
