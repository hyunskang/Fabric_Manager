class RecordsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @fabrics = Fabric.all
  end
end
