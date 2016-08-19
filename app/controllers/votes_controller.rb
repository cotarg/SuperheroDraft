class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.create(vote_create_params)
    redirect_to # current match? matches page?
  end

  private

  def vote_create_params
    params.permit(vote: [:team, :user])
  end

end
