class HeroesController < ApplicationController
  skip_before_action :require_login

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
    @hero = Hero.normalize(Hero.find_char(params[:id]))

    render :hero_display
  end

  def update
  end

  def destroy
  end

end
