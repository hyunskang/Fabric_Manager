class FabricController < ApplicationController
  before_filter :authenticate_user!

  def create
    # Validate the input passed to the controller action
    if validate_attr(params[:fabric])
      @fabric = Fabric.new(params[:fabric])
    end
    if @fabric.save
      respond_to do |format|
        format.js { render 'create.js.erb' }
        format.html { render :nothing => true, :notice => 'New Item added to Inventory' }
      end
    else
      render :nothing => true
    end
  end

  # Takes a hash as parameter and returns true or false
  def validate_attr(fab_attr)
    quantity = Integer(fab_attr[:quantity]) rescue false
    price = Float(fab_attr[:price]) rescue false
    if fab_attr[:serial].length < 10 || !/\W/.match(fab_attr[:serial]).nil?
      flash[:alert] = "Enter a valid alphanumeric serial number."
      return false
    elsif !/\W|\d/.match(fab_attr[:color]).nil?
      flash[:alert] = "Enter a valid color."
      return false
    elsif !quantity || !price
      flash[:alert] = "Enter a valid quantity or price."
      return false
    end
    return true
  end
end
