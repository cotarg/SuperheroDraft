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
    @heroes = Hero.find_all(params[:search])

    render :hero_options
  end

  def update
  end

  def destroy
  end

  private
 
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_login_url # halts request cycle
    end
  end
end

end
