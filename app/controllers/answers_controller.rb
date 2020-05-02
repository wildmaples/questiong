# frozen_string_literal: true

class AnswersController < ApplicationController
  def new
    @question = params[:question]
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:answer][:question_id])
    return meow('Question is nil') if @question.blank?

    @answer = @question.answer.build(answer_params)
    if @answer.save
      flash[:notice] = 'Your answer was successfully created 🙌'

      @question.updated_at = Time.now
      @question.save
      redirect_to question_path(@question)
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
