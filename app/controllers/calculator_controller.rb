class CalculatorController < ApplicationController
  before_filter :authenticate_user!

end