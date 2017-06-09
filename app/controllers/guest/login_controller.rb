class Guest::LoginController < Guest::ApplicationController
  def login
  end

  def sign_up_form
  end

  def sign_up
    @user = User.create(params.require(:user).permit(:email, :password))
    SessionCreator.new(session).create(@user.email ,@user.password)
    redirect_to @user
  end

  def validate
    @user = User.find_by(email: params[:user][:email])
    render json: @user.nil?
  end
end
