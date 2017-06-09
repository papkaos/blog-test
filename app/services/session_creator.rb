class SessionCreator

  def initialize(session)
    @session = session
  end

  def create(email, password)
    user = User.find_by(email: email, password: password)
    @session[:current_user_id] = user.id unless user.nil?
    user
  end

end
