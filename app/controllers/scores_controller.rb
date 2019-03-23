class ScoresController < ApplicationController
  def index
    @scores = current_user.scores
  end

  def show
    @score = current_user.scores.find(params[:id])
  end

  def new
    @score = Score.new
  end

  def create
    @score = current_user.scores.new(score_params)
    if @score.save
      redirect_to @score, notice: "#{@score.wakeup_on} の気分を登録しました。"
    else
      render :new
    end
  end

  def edit
    @score = current_user.scores.find(params[:id])
  end

  def update
    @score = current_user.scores.find(params[:id])
    if @score.update(score_params)
      redirect_to @score, notice: "#{@score.wakeup_on} の気分を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    score = current_user.scores.find(params[:id])
    score.destroy
    redirect_to scores_url, notice: "#{score.wakeup_on} の気分を削除しました。"
  end

  private
  def score_params
    params.require(:score).permit(:wakeup_on, :score, :reason, :cause)
  end

end
