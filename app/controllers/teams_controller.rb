class TeamsController < ApplicationController

  def index
    # (Should show all of a user's teams)
    # @teams = Team.where(user_id: params[]) || Team.new() #(This works, and is now the format for these.)
    @teams = Team.where(user_id: 12) || Team.new() #(This works, and is now the format for these.)
    render :index
  end

  def new
    @user = User.find_by(uid: session[:user_id])
    @team = Team.new
    render :create_team
  end

  def create
    @user = User.find_by(uid: session[:user_id])
    @team = Team.create(team_create_params[:team])
    redirect_to team_path(@team.id)
  end

  def edit
    @team = Team.find(params[:id])
    render :edit
  end

  def show
    @team = Team.find(params[:id])    
    @votes = Vote.where(team_id: @team.id).count
    @match_votes = @team.match.votes

    render :detail_view
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_create_params[:team])
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
    params.permit(team: [:user_id, :name, :cover_url])
  end

end
