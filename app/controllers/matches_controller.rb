class MatchesController < ApplicationController
  skip_before_action :require_login, only: :index

  def index
    @user = User.find_by(uid: session[:user_id])
    @matches = Match.limit(12).order('id desc')

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

  private
 
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_login_url # halts request cycle
    end
  end
end
