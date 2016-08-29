class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create, :new]

  def create
    auth_hash = request.env['omniauth.auth']
    user = User.find_or_create_by_omniauth(auth_hash)

    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      # I want to change this to an oops page, or partial?
      redirect_to root_path, alert: 'Could not log in'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
