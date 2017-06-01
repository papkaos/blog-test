class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(params.require(:user).permit(:email, :password))
    respond_to do |format|
      format.html { redirect_to @user, notice: 'You\'re successful signed up.' }
    end
  end

  def update
  end

  def destroy
  end

  def validate
    # @user = User.find_by(params[:email])
    # binding.pry
    @user = User.find_by(email: params[:user][:email])
    render json: @user.nil?
  end
end
