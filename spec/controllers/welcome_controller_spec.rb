require 'spec_helper'

describe WelcomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "should redirect to registration page when clicked on the link" do
      get 'index', :proceed => "register"
      response.should redirect_to new_user_registration_path
    end

    it "should redirect to sign in page when clicked on the link" do
      get 'index', :proceed => "login"
      response.should redirect_to new_user_session_path
    end
  end
end
