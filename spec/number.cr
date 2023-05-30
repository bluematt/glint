describe Number do
  it "should support degrees" do
    0.degrees.should eq(0)
    10.degrees.should eq(10)
    -10.degrees.should eq(-10)
  end

  it "should support radians" do
    0.radians.should eq(0)
    10.radians.should eq(10)
    -10.radians.should eq(-10)
  end

  it "should support pixels" do
    0.pixels.should eq(0)
    10.pixels.should eq(10)
    -10.pixels.should eq(-10)
  end

  it "should support fps" do
    0.fps.should eq(0)
    10.fps.should eq(10)
  end

  expect_raises(ValueError) do
    -10.fps.should eq(0)
  end

  it "should convert degrees to radians" do
    (0.degrees.to_radians).should eq(0)             # radians
    (90.degrees.to_radians).should eq(Math::PI/2)   # radians
    (180.degrees.to_radians).should eq(Math::PI)    # radians
    (360.degrees.to_radians).should eq(Math::TAU)   # radians
    (-90.degrees.to_radians).should eq(-Math::PI/2) # radians
    (-180.degrees.to_radians).should eq(-Math::PI)  # radians
    (-360.degrees.to_radians).should eq(-Math::TAU) # radians
  end

  it "should convert radians to degrees" do
    (0.radians.to_degrees).should eq(0)               # degrees
    ((Math::PI/2).radians.to_degrees).should eq(90)   # degrees
    (Math::PI.radians.to_degrees).should eq(180)      # degrees
    (Math::TAU.radians.to_degrees).should eq(360)     # degrees
    ((-Math::PI/2).radians.to_degrees).should eq(-90) # degrees
    (-Math::PI.radians.to_degrees).should eq(-180)    # degrees
    (-Math::TAU.radians.to_degrees).should eq(-360)   # degrees
  end
end
