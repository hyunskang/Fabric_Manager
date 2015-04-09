class UserController < ApplicationController
  before_filter :authenticate_user!

  def show
    @fabrics = Fabric.all
  end
end
