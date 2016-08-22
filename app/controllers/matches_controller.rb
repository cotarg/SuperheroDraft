class MatchesController < ApplicationController

  def index
    @open_matches = Match.where(phase: 1)
    @voting_matches = Match.where(phase: 2)
    @closed_matches = Match.where(phase: 3)

  end

  def new
    @Match = Match.new
    render :create_match
  end

  def create
    @Match = Match.create(match_create_params[:match])
    redirect_to match_path
  end

  def edit
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
    params.permit(match: [:title, :stakes])
  end

end
