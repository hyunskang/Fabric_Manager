class RecordsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @fabrics = Fabric.all
  end

  def display
    @records = Fabric.where("id=?", params[:id]).first.records
    respond_to do |format|
      format.js { render 'transactions.js.erb'}
      format.html { render :show }
    end
  end

  def search_by_date
    # Find records using the input date and do AJAX and UJS path
    # logger.debug "PARAMS: #{params}"
  end
end
