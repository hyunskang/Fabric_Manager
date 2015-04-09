class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to user_index_path
    end
  end
end
