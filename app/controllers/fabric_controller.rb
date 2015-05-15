class FabricController < ApplicationController
  before_filter :authenticate_user!

  def create
    # Validate the input passed to the controller action
    if validate_attr(params[:fabric])
      @fabric = Fabric.create(params[:fabric])
      respond_to do |format|
        format.js { render 'create.js.erb' }
        format.html { redirect_to user_path(params[:user_id]), :notice => 'New Item added to Inventory' }
      end
    else
      render :nothing => true
    end
  end

  # Takes a hash as parameter and returns true or false
  def validate_attr(fab_attr)
    quantity = Integer(fab_attr[:quantity]) rescue false
    price = Float(fab_attr[:price]) rescue false
    if Fabric.repeated_serial?(fab_attr[:serial])
      flash[:alert] = "An item with the serial number #{fab_attr[:serial]} already exists."
      return false
    elsif fab_attr[:serial].length < 10 || !/\W/.match(fab_attr[:serial]).nil?
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
