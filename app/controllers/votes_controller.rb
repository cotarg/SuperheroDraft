class VotesController < ApplicationController
  before_action :require_login

  def new
    @user = User.find_by(uid: session[:user_id])
    @vote = Vote.new
  end

  def create
    @user = User.find_by(uid: session[:user_id])
    @vote = Vote.create(vote_create_params)
    redirect_to match_path(@vote.team.match_id)
  end

  private

  def vote_create_params
    params.permit(:team_id, :user_id)
  end

end
