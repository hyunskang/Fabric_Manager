require 'spec_helper'

describe UserController do
 
  @user = login :user

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should redirect_to user_path(@user)
    end
  end

  describe "GET 'show'" do
  	it "returns http success when existing user is logged in" do
      get 'show', :id => @user
      response.should be_success
  	end
  end
end
