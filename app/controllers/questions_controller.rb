# frozen_string_literal: true

class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question was successfully created'
      redirect_to question_path(@question)
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = 'Your question was successfully updated 🙌'
      redirect_to question_path(@question)
    else
      render 'edit'
    end
  end

  def create_answer
    @question = Question.find(params[:question_id])
                        .Answers.create(params[:answer])
    if @question.save
      flash[:notice] = 'Answer was sucessfully created'
      redirect_to question_path(@question)
    else
      flash[:notice] = 'Something went wrong'
    end
  end

  # No UI exists to destroy question yet
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = 'Question was successfully deleted'
    redirect_to questions_path
  end

  def index
    @questions = Question.all
  end

  private

  def question_params
    params.require(:question).permit(:question, :name, :stay_anonymous)
  end
end
