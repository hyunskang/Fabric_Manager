require 'spec_helper'

describe CalculatorController do
  @user = login :user

  describe "calculate with the given values" do
    before :each do
      @fabric = FactoryGirl.create(:fabric)
      @meters = 20.0
    end

    it "should redirect to fabric show" do
      post 'calculate', :user_id => @user.id, :fabric_id => @fabric.id, :meters => @meters, :fabric => {price: @fabric.price}
      response.should redirect_to user_fabric_path(@user, @fabric)
    end

    it "should calculate update correctly meters sold" do
      post 'calculate', :user_id => @user.id, :fabric_id => @fabric.id, :meters => @meters, :fabric => {price: @fabric.price}
      @fabric.reload
      @fabric.meters_sold.should == @meters
    end

    it "should correctly calculate and update total profit" do
      post 'calculate', :user_id => @user.id, :fabric_id => @fabric.id, :meters => @meters, :fabric => {price: @fabric.price}
      @fabric.reload
      @fabric.total_profit.should == @meters*@fabric.price
    end
  end
end