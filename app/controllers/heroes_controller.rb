class HeroesController < ApplicationController

  def index
    if params[:q]
      @heroes = Hero.find_all(params[:q])
    end
    render :search
  end

  def new
  end

  def create
  end

  def edit
  end

  def show
    @heroes = Hero.find_all(params[:search])

    render :hero_options
  end

  def update
  end

  def destroy
  end

end
