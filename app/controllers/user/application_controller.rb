class User::ApplicationController < ApplicationController

  before_action :authenticate_user

  def authenticate_user
    if session[:current_user_id].nil?
      redirect_to :login
    else
      @current_user = User.find(session[:current_user_id])
    end
  end

end
