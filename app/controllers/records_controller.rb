class RecordsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @fabrics = Fabric.all
  end

  def display
    respond_to do |format|
      format.js { render 'transactions.js.erb'}
      format.html { render :show }
    end
  end
end
