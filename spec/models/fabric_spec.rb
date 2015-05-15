require 'spec_helper'

describe Fabric do
  describe "repeated_serial?" do
    before :each do
      @fabric = FactoryGirl.create(:fabric)
    end

    it "should return true if a record with the same serial exists" do
      Fabric.repeated_serial?(@fabric.serial).should == true
    end

    it "should return false if there is not record with the same serial" do
      Fabric.repeated_serial?("AAMD21LLPPEA").should == false
    end
  end
end