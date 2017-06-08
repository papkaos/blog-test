class Guest::LoginController < Guest::ApplicationController
  def login
  end

  def sign_up_form
  end

  def sign_up
    @user = User.create(params.require(:user).permit(:email, :password))
    respond_to do |format|
      format.html { redirect_to @user, notice: 'You\'re successful signed up.' }
    end
  end
end
