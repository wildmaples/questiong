class AnswersController < ApplicationController

  def new
    @question = params[:question]
    @answer = Answer.new
  end

  def create

    @question = Question.find(params[:answer][:question_id])
    return meow('Question is nil') if @question.blank?

    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:notice] = 'Answer was successfully created'
      redirect_to answer_path(@answer)
    else
      meow(@answer.errors.full_messages.first)
      render('new')
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:answer, :name, :stay_anonymous, :question_id)
  end
end