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
    @score = Score.find(params[:id])
  end

  def update
    score = Score.find(params[:id])
    score.update!(score_params)
    redirect_to scores_url, notice: "#{score.wakeup_on} の気分を更新しました。"
  end

  def destroy
    score = Score.find(params[:id])
    score.destroy
    redirect_to scores_url, notice: "#{score.wakeup_on} の気分を削除しました。"
  end

  private
  def score_params
    params.require(:score).permit(:wakeup_on, :score, :reason, :cause)
  end

end
