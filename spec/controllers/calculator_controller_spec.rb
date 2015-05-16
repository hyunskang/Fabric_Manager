require 'spec_helper'

describe CalculatorController do
  @user = login :user

  describe "GET index" do
    it "should be success" do
      get 'index', :user_id => @user.id
      response.should be_success
    end
  end
end