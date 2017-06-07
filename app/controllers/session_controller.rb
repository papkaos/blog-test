class SessionController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email], password: params[:session][:password])
    if !@user.nil?
      session[:current_user_id] = @user.id
      redirect_to @user
    else
      respond_to do |format|
        format.json { render json: {status: "auth_error"} }
      end
    end
    # respond_to do |format|
    #   format.json { render json: {status: user} }
    # end
  end

  def destroy
  end
end
