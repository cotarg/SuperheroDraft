class UsersController < ApplicationController

  def index
  end

  def create
    @user = User.new(user_create_params[:user])
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
  end

  def update
  end


  def destroy
  end

  private

  def user_create_params
    params.permit(user: [:name, :email, :password, :password_confirmation])
  end

end
