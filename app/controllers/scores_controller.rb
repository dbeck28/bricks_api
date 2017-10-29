class ScoresController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :set_score, only: [:show, :update, :destroy]

  # GET /scores
  def index
    @scores = Score.all

    render json: @scores
  end

  # GET /scores/1
  def show
    render json: @score
  end

  # POST /scores
  def create
    params.permit!
    @score = Score.new(params[:score_params])
    @score.user_id = params["user_id"]
    @score.score = params["score"]
    @score.save
    render json: @score, status: :created, location: @score
    # else
    #   render json: @score.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /scores/1
  def update
    if @score.update(score_params)
      render json: @score
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  # DELETE /scores/1
  def destroy
    @score.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    def post_params
      params.require(:post).permit!(:score, :user_id)
    end

    # Only allow a trusted parameter "white list" through.
    def score_params
      params.fetch(:score, {}).permit(:score, :user_id)
    end
end
