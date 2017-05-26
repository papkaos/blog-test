class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    render json: @user
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  def validate
    @user = User.find_by(params[:email])
    # respond_to do |format|
    #   format.json { render :show }
    # end

    # render json: @user

    # @user = User.find_by(params[:email])
  end
end
