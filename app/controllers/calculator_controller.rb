class CalculatorController < ApplicationController
  before_filter :authenticate_user!

  def calculate
    # Should calculate the total cost from the meters received and update
    # the total meters sold and total profit
    # Future updates: should update the daily records by creating new record and adding to the
    # array of records. For this create an association of fabric has many records.
    input_meters = BigDecimal.new(params[:meters])
    @fabric = Fabric.where("id=?", params[:fabric_id]).first
    @fabric.update_attributes({meters_sold: input_meters + @fabric.meters_sold, total_profit: input_meters*@fabric.price + @fabric.total_profit})
    respond_to do |format|
      format.js
      format.html {redirect_to user_fabric_path(params[:user_id], params[:fabric_id])}
    end
  end
end