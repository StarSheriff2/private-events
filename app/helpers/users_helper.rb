module UsersHelper
  def current_user
    User.find_by(id: session[:current_user_id]) if session[:current_user_id]
  end
end
