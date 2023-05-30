describe Game do
  it "should be created" do
    game = Game.new
    game.should be_a(Glint::Game)
  end

  it "should not be paused" do
    game = Game.new
    game.paused?.should be_false
    Game.paused?.should be_false
  end

  it "should be able to be paused" do
    game = Game.new
    game.paused = true
    game.paused?.should be_true
    Game.paused?.should be_true
  end

  it "should be able to set the target framerate" do
    game = Game.new
    game.target_framerate = 30.fps
    game.target_framerate.should eq(30)
    Game.target_framerate.should eq(30)
  end
end
