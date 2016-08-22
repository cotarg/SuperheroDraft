class HeroesController < ApplicationController

  def index
    @heroes = Hero.find_all(params[:search])
  end

  def new
  end

  def create
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

end
