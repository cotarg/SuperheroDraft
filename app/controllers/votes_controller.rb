class VotesController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.find_by(uid: session[:user_id])
    @vote = Vote.new
  end

  def create
    @user = User.find_by(uid: session[:user_id])
    @vote = Vote.create(vote_create_params)
    redirect_to # current match? matches page?
  end

  private

  def vote_create_params
    params.permit(vote: [:team, :user])
  end

end
