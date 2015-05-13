class WelcomeController < ApplicationController
  def index
    if !user_signed_in?
      logger.debug "action: #{params[:proceed]}"
      if params[:proceed] == "register"

        redirect_to new_user_registration_path
      elsif params[:proceed] == "login"
        redirect_to new_user_session_path
      end
    else
      redirect_to user_path(current_user)
    end
  end
end
