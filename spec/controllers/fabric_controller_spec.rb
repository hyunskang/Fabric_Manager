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
      FabricController.any_instance.stub(:validate_attr).and_return(true)
      post 'create', :user_id => 1, :fabric => @fabric_param
      response.should be_success
    end

    it "should create a new fabric record" do 
      expect{
        FabricController.any_instance.stub(:validate_attr).and_return(true)
        post 'create', :user_id => 1, :fabric => @fabric_param
        }.to change{Fabric.count}.by(1)
    end
  end

  describe "validate input" do
    before :each do
      @test_params = {
        color: "Yellow",
        serial: "AMMEL123EEA",
        quantity: 200,
        price: 2.44
      }
    end

    it "should detect invalid character in serial number" do
      @test_params[:serial] = "@@@@"
      controller.validate_attr(@test_params).should == false
    end

    it "should detect a serial number with less than 10 characters" do
      @test_params[:serial] = "A"
      controller.validate_attr(@test_params).should == false
    end

    it "should assign the correct serial error message" do
      @test_params[:serial] = "A"
      controller.validate_attr(@test_params)
      flash[:alert].should == "Enter a valid alphanumeric serial number."
    end

    it "should detect invalid character in color" do
      @test_params[:color] = "22@11"
      controller.validate_attr(@test_params).should == false
    end

    it "should assign the correct color error message" do
      @test_params[:color] = "22@11"
      controller.validate_attr(@test_params)
      flash[:alert].should == "Enter a valid color."
    end

    it "should detect invalid quantity input" do
      @test_params[:quantity] = "EE"
      controller.validate_attr(@test_params).should == false
    end

    it "should detect invalid price input" do
      @test_params[:price] = "@@"
      controller.validate_attr(@test_params).should == false
    end

    it "should assign the correct price/quantity error message" do 
      @test_params[:price] = "@@"
      @test_params[:quantity] = "A"
      controller.validate_attr(@test_params)
      flash[:alert].should == "Enter a valid quantity or price."
    end 
  end
end
