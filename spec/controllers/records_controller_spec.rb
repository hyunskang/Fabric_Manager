require 'spec_helper'

describe RecordsController do
  @user = login :user

  describe "index method" do
    it "GET index should be successful" do
      get 'index', :user_id => @user.id
      response.should be_success
    end

    it "should assign @fabrics with the correct list of fabrics" do
      fabric = FactoryGirl.create(:fabric)
      get 'index', :user_id => @user.id
      assigns(:fabrics).should == [fabric]
    end
  end

  describe "describe method" do
    before :each do
      @record = FactoryGirl.create(:record)
      @fabric = FactoryGirl.create(:fabric)
    end

    it "GET display should render show" do
      get 'display', :user_id => @user.id, :id => @fabric.id
      response.should render_template(:show)
    end

    it "should assign @records with the correct records" do
      get 'display', :user_id => @user.id, :id => @fabric.id
      assigns(:records).should == []
    end
  end
end
