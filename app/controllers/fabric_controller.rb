class FabricController < ApplicationController
  before_filter :authenticate_user!

  def create
    @fabric = Fabric.new(params[:fabric])
    if @fabric.save
      respond_to do |format|
        format.js { render 'create.js.erb' }
        format.html { render :nothing => true, :notice => 'New Item added to Inventory' }
      end
    else
      render :nothing => true
    end
  end
end
