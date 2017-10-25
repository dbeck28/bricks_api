class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  #GET /users
  def index
    @users = User.all
    render json: @users
  end
  # Get /users/1
  def show
    render json :@user
  end
  #POST /dog_parks
  def create
    User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @users
    else
      render json: @user.errors, status: :unprocessable_entity
   end
  end
  # PATCH/PUT/dog_pars/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.error, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

end

