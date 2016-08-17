class TeamsController < ApplicationController

  def index
    # (Should show all of a user's teams)
    @teams = Team.where(user_id: params[]) || Team.new() #(This works, and is now the format for these.)
    render :index
  end

  def new
    @team = Team.new
    render :create_team
  end

  def create
    @team = Team.create(team_create_params[:team])

    redirect_to team_path
  end

  def edit
    @team = Team.find(params[:id])
    render :edit
  end

  def show
    @team = Team.find(:id)
    render :detail_view
  end

  # I think I need to change this ultimately since updating occurs in the context of matches? I dunno. Need to think about what I'm doing here.
  def update
    @team = Team.find(params[:id])
    @team.update(team_create_params[:team])
    redirect_to team_path
  end

  def delete
    Team.destroy(params[:id])
    if params[:id] == true 
      redirect_to root_path
    end 
  end

end
