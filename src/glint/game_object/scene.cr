module Glint
  # A scene manages collections of `GameObject`s.
  class Scene < GameObject
    # The scene's background color.
    property background_color : Color?

    # Creates a new scene.
    def initialize; end

    # Creates a new scene with a specific background color.
    def initialize(@background_color); end
  end
end
