module UsersHelper
  def current_user
    User.find_by(id: session[:current_user_id]) if session[:current_user_id]
  end

  def user_created_events
    @user.created_events.all
  end
end
