class MatchesController < ApplicationController

  def index
    @open_matches = Match.where(phase: 1)
    @voting_matches = Match.where(phase: 2)
    @closed_matches = Match.where(phase: 3)

    render :index
  end

  def new
    @match = Match.new
    render :create_match
  end

  def create
    @match = Match.create(match_create_params[:match])
    @match_id = @match.id
    redirect_to match_path(@match_id)
  end

  def edit
    @match = Match.find(params[:id])
    @user = Person.new
    render :edit
  end

  def show
    @match = Match.find(params[:id])
    @teams = Team.where(match_id: @match.id)
    @votes = Match.assemble_match_votes(@match.id)
    render :match_page
  end

  def update
  end

  def destroy
  end

  private

  def match_create_params
    params.permit(match: [:name, :stakes])
  end

end
