class MatchesController < ApplicationController

  def index
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
