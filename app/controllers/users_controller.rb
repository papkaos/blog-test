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
    @user = User.find(params[:id])
    @user.update(params.require(:user).permit(:first_name, :last_name, :email, :avatar))
    respond_to do |format|
      format.html { redirect_to @user }
    end
  end

  def destroy
  end

  def validate
    # @user = User.find_by(params[:email])
    # binding.pry
    @user = User.find_by(email: params[:user][:email])
    # if params[:except_id].present?
    #   render json: @user.nil? || @user.id == params[:except_id]
    # else
    #   render json: @user.nil?
    # end
    render json: @user.nil?
  end

  def validate_email
    @user = User.where.not(id: params[:id]).where(email: params[:user][:email]).first
    render json: @user.nil?
  end
end
