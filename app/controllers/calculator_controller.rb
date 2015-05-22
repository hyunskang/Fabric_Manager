class CalculatorController < ApplicationController
  before_filter :authenticate_user!

  def calculate
    # Should calculate the total cost from the meters received and update
    # the total meters sold and total profit
    # Future updates: should update the daily records
    # Future updates: should update the daily records by creating new record and adding to the
    # array of records. For this create an association of fabric has many records.
    input_meters = BigDecimal.new(params[:meters])
    @fabric = Fabric.where("id=?", params[:fabric_id]).first
    data_hash = parse_data_from_params(@fabric)
    @fabric.update_attributes({meters_sold: data_hash[:meters_sold], total_profit: data_hash[:profit]})
    @fabric.add_new_record(data_hash)
    respond_to do |format|
      format.js {render 'calculate.js.erb'}
      format.html {redirect_to user_fabric_path(params[:user_id], params[:fabric_id])}
    end
  end

  def parse_data_from_params(fabric)
    input_meters = BigDecimal.new(params[:meters])
    data = Hash.new
    data[:meters_sold] = input_meters + fabric.meters_sold
    data[:profit] = input_meters*fabric.price + fabric.total_profit
    data[:price] = params[:fabric][:price]
    data[:transaction_year] = params["transaction_date(1i)"]
    data[:transaction_month] = params["transaction_date(2i)"]
    data[:transaction_day] = params["transaction_date(3i)"]
    data
  end
end