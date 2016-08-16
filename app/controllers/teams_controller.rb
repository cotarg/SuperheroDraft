class TeamsController < ApplicationController

  def index
    # @teams = Team.where(user_id: 12) || Team.new() (This works, and is now the format for these.)

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
    # adding heroes to teams.
  end

  def show
    # shows all the details for a team.
    @team = Team.find(:id)

    redirect_to # what?
  end

  def update

  end

  def destroy
  end

end
