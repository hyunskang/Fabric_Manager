require 'spec_helper'

describe FabricController do
  login :user
  describe "create fabric" do
    before :each do
      Fabric.any_instance.stub(:repeated_serial?).and_return(false)
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
      response.should redirect_to user_path(1)
    end

    it "should create a new fabric record" do 
      expect{
        FabricController.any_instance.stub(:validate_attr).and_return(true)
        post 'create', :user_id => 1, :fabric => @fabric_param
        }.to change{Fabric.count}.by(1)
    end

    it "should render nothing if it fails to validate input" do
      FabricController.any_instance.stub(:validate_attr).and_return(false)
      post 'create', :user_id => 1, :fabric => @fabric_param
      response.should_not render_template :show
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

    it "should assign the correct repeated serial error message" do
      fabric = FactoryGirl.create(:fabric)
      @test_params[:serial] = fabric.serial
      controller.validate_attr(@test_params)
      flash[:alert].should == "An item with the serial number #{fabric.serial} already exists."
    end

    it "should return true for correct input" do
      controller.validate_attr(@test_params).should == true
    end
  end

  describe "remove fabric from inventory" do
    it "should remove the item from the database" do
      fabric = FactoryGirl.create(:fabric)
      delete 'destroy', :user_id => 1, :id => fabric.id
      response.should redirect_to user_path(1)
    end
  end 

  describe "GET index" do
    it "should be success" do
      get 'index', :user_id => 1
      response.should be_success
    end
  end

  describe "GET show" do
    it "should be success" do
      fabric = FactoryGirl.create(:fabric)
      get 'show', :user_id => 1, :id => fabric.id
      response.should be_success
    end
  end
end
