class UserController < ApplicationController
  before_filter :authenticate_user!

  def index
    redirect_to user_path(current_user)
  end

  def show
  	@user = current_user
    @fabrics = Fabric.all
    gon.user_id = @user.id
    render(:partial => 'create_fabric') if request.xhr?
  end
end
