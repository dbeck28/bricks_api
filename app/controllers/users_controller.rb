class UsersController < ApplicationController

  def create
    new_user = User.create(params[:user])
    if user.save
      render json: user, status: 201, location [:api, user]
    else
      status: 422
    end
  end

end

