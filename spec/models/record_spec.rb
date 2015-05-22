require 'spec_helper'

describe Record do
  describe "update the record" do
    before :each do
      Time.any_instance.stub(:month).and_return(5)
      Time.any_instance.stub(:day).and_return(20)
      Time.any_instance.stub(:year).and_return(2015)
      @data = {newData: 20123}
      @record = Record.new
    end

    it "should get the correct month, day, and year" do
      @record.update_record(@data)
      @record.year.should == 2015
      @record.month.should == 5
      @record.day.should == 20
    end

    it "should get the data hash as content" do
      @record.update_record(@data)
      @record.content.should == {"newData" => 20123}
    end
  end
end
