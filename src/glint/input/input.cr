module Glint
  module Input
    # Action states
    private STATES = [:pressed, :down, :released, :up]
  end
end

require "./controller.cr"
require "./key.cr"
require "./mouse.cr"
require "./touch.cr"
require "./cursor.cr"
