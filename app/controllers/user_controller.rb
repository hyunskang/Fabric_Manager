class UserController < ApplicationController
  before_filter :authenticate_user!

  def index
    redirect_to user_path(current_user)
  end

  def show
    @fabrics = Fabric.all
  end
end
