class Helpers
  def self.current_user(session)
    @user = User.find(session[:user_id])
    @user
  end
end
