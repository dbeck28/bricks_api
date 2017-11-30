class PotController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :set_pot, only: [:show, :update, :destroy]

  def index
    @pot = Pot.all
    render json: @scores
  end

  def show
    render json: @pot
  end

  def create

  end

  def update
    if @pot.update(pot_params)
      render json: @pot
    else
      render json: @pot.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @pot.destroy
  end
end
