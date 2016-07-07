module SessionsHelper

  def log_in(user)
    session[:user_id]=user.id
  end

  def current_user
    @current_user ||= User.findby(id: session[:user_id])
  end

end
