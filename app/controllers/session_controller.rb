class SessionController < ApplicationController
  def new
  end

  def create
    @user = SessionCreator.new(session).create(params[:session][:email],params[:session][:password])
    if !@user.nil?
      redirect_to @user
    else
      respond_to do |format|
        format.json { render json: {status: "auth_error"} }
      end
    end
  end

  def destroy
    session.clear
    redirect_to :login
  end
end
