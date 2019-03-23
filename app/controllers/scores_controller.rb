class ScoresController < ApplicationController
  def index
    @scores = Score.all
  end

  def show
    @score = Score.find(params[:id])
  end

  def new
    @score = Score.new
  end

  def create
    score = Score.new(score_params)
    score.save!
    redirect_to scores_url, notice: "#{score.wakeup_on} の気分を登録しました。"
  end

  def edit
  end

  private
  def score_params
    params.require(:score).permit(:wakeup_on, :score, :reason, :cause)
  end

end
