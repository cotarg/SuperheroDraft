class MatchesController < ApplicationController

  def index
    @user = User.find_by(uid: session[:user_id])
    @open_matches = Match.where(phase: 1)
    @voting_matches = Match.where(phase: 2)
    @closed_matches = Match.where(phase: 3)

    render :index
  end

  def new
    @user = User.find_by(uid: session[:user_id])
    @match = Match.new
    render :create_match
  end

  def create
    @user = User.find_by(uid: session[:user_id])
    @match = Match.create(match_create_params[:match])
    @match_id = @match.id
    redirect_to match_path(@match_id)
  end

  def edit
    @user = User.find_by(uid: session[:user_id])
    @match = Match.find(params[:id])
    if params[:q]
      @heroes = Hero.find_all(params[:q])
    end
    render :edit
  end

  def show
    @user = User.find_by(uid: session[:user_id])
    @match = Match.find(params[:id])
    @teams = @match.teams
    @single_vote = Vote.new
    @votes = @match.votes
    render :match_page
  end

  def update
  end

  def destroy
  end

  private

  def match_create_params
    params.permit(match: [:name, :stakes, :phase])
  end

end
