class CalculatorController < ApplicationController
  before_filter :authenticate_user!

  def calculate
    # Should calculate the total cost from the meters received and update
    # the total meters sold and total profit
    # Future updates: should update the daily records
  end
end