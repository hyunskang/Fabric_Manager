require 'spec_helper'

describe FabricController do
  login :user
  describe "create fabric" do
    before :each do
      @fabric_param = {
        color: "Red",
        serial: "AMMEL123EEA",
        quantity: 200,
        price: 2.44
      }
    end

    it "response should be success" do
      post 'create', :user_id => 1, :fabric => @fabric_param
      response.should be_success
    end

    it "should create a new fabric record" do 
      expect{
        post 'create', :user_id => 1, :fabric => @fabric_param
        }.to change{Fabric.count}.by(1)
    end
  end
end
