class TeamsController < ApplicationController

  def index
    # (Should show all of a user's teams)
    # @teams = Team.where(user_id: params[]) || Team.new() #(This works, and is now the format for these.)
    @teams = Team.where(user_id: 12) || Team.new() #(This works, and is now the format for these.)
    render :index
  end

  def new
    @user = User.find_by(uid: session[:user_id])
    @match = Match.find_by(id: params[:match_id])
    @team = Team.new
    render :create_team
  end

  def create
    @user = User.find_by(uid: session[:user_id])
    @team = Team.create(team_create_params[:team])
    @match = Match.find(@team.match_id)
    redirect_to edit_match_team_path(@team.match_id, @team.id)
  end

  def edit
    @team = Team.find(params[:id])
    @match = Match.find(@team.match_id)
    if params[:q]
      @heroes = Hero.find_all(params[:q])
    end
    render :edit
  end

  def show
    @team = Team.find(params[:id]) 
    @match = Match.find(@team.match_id)   
    @votes = Vote.where(team_id: @team.id).count
    @match_votes = @team.match.votes

    render :detail_view
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_update_params[:team])
    redirect_to 
  end

  def delete
    Team.destroy(params[:id])
    if params[:id] == true 
      redirect_to root_path
    end 
  end

  private

  def team_create_params
    params.permit(team: [:user_id, :name, :match_id, :cover_url])
  end

  def team_update_params
    params.permit(team: [:hero_one, :hero_two, :hero_three, :hero_four, :hero_five, :hero_six, :villain_one, :villain_two, :villain_three, :villain_four, :cover_url, :pitch])
  end

end
