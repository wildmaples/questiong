class AnswersController < ApplicationController

  def new
    @question = params[:question]
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question])
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:notice] = 'Answer was successfully created'
      redirect_to answer_path(@answer)
    else
      render 'new'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:answer, :name, :stay_anonymous)
  end
end