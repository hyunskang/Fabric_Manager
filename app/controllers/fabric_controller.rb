class FabricController < ApplicationController
  before_filter :authenticate_user!

  def index
    @fabrics = Fabric.all
  end

  def show
    @fabric = Fabric.where("id=?", params[:id]).first
  end

  def search
    @fabric = Fabric.where("serial=?", params[:fabric][:serial]).first
    respond_to do |format|
      format.js {render 'show.js.erb'}
      format.html {redirect_to user_fabric_path(current_user, @fabric)}
    end
  end

  def create
    # Validate the input passed to the controller action
    @user = User.where("id=?", params[:user_id]).first
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

  def destroy
    @fabric = Fabric.where("id=?", params[:id]).first
    @fabric.destroy
    respond_to do |format|
      format.js {render 'destroy.js.erb'}
      format.html { redirect_to user_path(params[:user_id]), :notice => "Fabric S/N: #{@fabric.serial} removed successfully"}
    end
  end

  # Takes a hash as parameter and returns true or false
  def validate_attr(fab_attr)
    if !valid_serial?(fab_attr[:serial])
      return false
    elsif !/\W|\d/.match(fab_attr[:color]).nil?
      flash[:alert] = "Enter a valid color."
      return false
    elsif !valid_price_or_quantity?(fab_attr[:price], fab_attr[:quantity])
      return false
    end
    return true
  end

  def valid_serial?(serial)
    if Fabric.repeated_serial?(serial)
      flash[:alert] = "An item with the serial number #{serial} already exists."
      return false
    elsif serial.length < 10 || !/\W/.match(serial).nil?
      flash[:alert] = "Enter a valid alphanumeric serial number."
      return false
    end
    return true
  end

  def valid_price_or_quantity?(price, quantity)
    quantity = Integer(quantity) rescue false
    price = Float(price) rescue false
    if !quantity || !price
      flash[:alert] = "Enter a valid quantity or price."
      return false
    end
    return true
  end
end
