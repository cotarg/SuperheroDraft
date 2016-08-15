class TeamsController < ApplicationController

  def index
    # @teams = Team.where(user_id: 12) || Team.new() (This works, and is now the format for these.)

    render :index
  end

  def new
    # instantiate a team
  end

  def create
    # the form for adding first team
  end

  def edit
    # adding heroes to teams.
  end

  def show
    # shows all the details for a team.
  end

  def update
    
  end

  def destroy
  end

end
