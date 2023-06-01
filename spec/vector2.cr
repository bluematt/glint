alias Vector2 = Glint::Vector2

describe Vector2 do
  it "should be negated" do
    v = Vector2.new x: 1, y: 2

    (-v).should eq(Vector2.new x: -1, y: -2)
    (-(-v)).should eq(v)
  end

  it "should add two vectors" do
    v1 = Vector2.new x: 1, y: 2
    v2 = Vector2.new x: 3, y: 4

    (v1 + v2).should eq(Vector2.new x: 4, y: 6)
    (v2 + v1).should eq(Vector2.new x: 4, y: 6)
  end

  it "should subtract two vectors" do
    v1 = Vector2.new x: 1, y: 2
    v2 = Vector2.new x: 3, y: 4

    (v1 - v2).should eq(Vector2.new x: -2, y: -2)
    (v2 - v1).should eq(Vector2.new x: 2, y: 2)
  end

  it "should multiply by a factor" do
    v = Vector2.new x: 1, y: 2
    f = 3

    (v * f).should eq(Vector2.new x: 3, y: 6)
    (v * -f).should eq(Vector2.new x: -3, y: -6)
  end

  it "should multiply by a factor vector" do
    v = Vector2.new x: 1, y: 2
    f = Vector2.new x: 2, y: 3

    (v * f).should eq(Vector2.new x: 2, y: 6)
    (v * -f).should eq(Vector2.new x: -2, y: -6)
  end

  # TODO More `Vector2` tests.
end
