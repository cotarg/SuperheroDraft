class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @user = current_user
    @matches = Match.where("created_at < ?", 5.days.ago)
    render :index
  end

  helper_method :current_user, :user_favorited?, :current_page


 def current_user
   @user ||= User.find_by(uid: session[:user_id])
 end

 def require_login
   if current_user.nil?
     flash[:error] = "You must be logged in to view this section"
     redirect_to root_path
   end
 end

end
