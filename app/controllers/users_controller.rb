class UsersController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :restrict_access
  # skip_before_action :verify_authenticity_token

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
   @user = User.find_by(:email => params[:email])
   if @user.authenticate(params[:password_digest])
     @user = User.find_by(:email => params[:email])
     render json: @user
   end
  end

  # def login
    # @user = User.find_by(params.require(:user).permit(:email, :password_digest))
  #   render json: @user
  # end

  # POST /users
  def create
    @user = User.create(params.require(:user).permit(:name, :username, :email, :password_digest))
    @user.password = @user.password_digest
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.fetch(:user, {})
    end



    def post_params
      params.require(:post).permit(:name, :username, :email, :password_digest)
    end

    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
      end
    end
end
