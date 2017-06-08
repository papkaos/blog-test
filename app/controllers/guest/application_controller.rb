class Guest::ApplicationController < ApplicationController

  before_action :check_user

  def check_user
    redirect_to User.find(session[:current_user_id]) unless session[:current_user_id].nil?
  end

end
