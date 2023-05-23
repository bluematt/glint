describe Number do
  it "should convert degrees to radians" do
    (0.degrees).should eq(0) # radians
    (90.degrees).should eq(Math::PI/2) # radians
    (180.degrees).should eq(Math::PI) # radians
    (360.degrees).should eq(Math::TAU) # radians
    (-90.degrees).should eq(-Math::PI/2) # radians
    (-180.degrees).should eq(-Math::PI) # radians
    (-360.degrees).should eq(-Math::TAU) # radians
  end

  it "should convert radians to degrees" do
    (0.radians).should eq(0) # degrees
    ((Math::PI/2).radians).should eq(90) # degrees
    (Math::PI.radians).should eq(180) # degrees
    (Math::TAU.radians).should eq(360) # degrees
    ((-Math::PI/2).radians).should eq(-90) # degrees
    (-Math::PI.radians).should eq(-180) # degrees
    (-Math::TAU.radians).should eq(-360) # degrees
  end
end
