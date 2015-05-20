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

  describe "create a new record" do
    before :each do
      @fabric = FactoryGirl.create(:fabric)
      Time.any_instance.stub(:month).and_return(5)
      Time.any_instance.stub(:day).and_return(20)
      Time.any_instance.stub(:year).and_return(2015)
      @data = {"sold_meters" => 20.2}
    end

    it "should create a new record in the db" do
      @fabric.add_new_record(@data)
      Record.count.should == 1
    end

    it "should add a new record to the list of records of the fabric" do
      @fabric.add_new_record(@data)
      @fabric.records.should_not == []
    end
  end
end