# frozen_string_literal: true

class QuestionsController < ApplicationController

  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action only: [ :edit, :update, :destroy] do
    require_same_user(@question.user)
  end
  

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      flash[:notice] = 'Your question was successfully posted 🙌'
      redirect_to question_path(@question)
    else
      render 'new'
    end
  end

  def show
    @answer = @question.answer
  end

  def edit
  end

  def update
    if @question.update(question_params)
      flash[:notice] = 'Your question was successfully updated 🙌'
      redirect_to question_path(@question)
    else
      render 'edit'
    end
  end

  # No UI exists to destroy question yet
  def destroy
    @question.destroy
    flash[:notice] = 'Question was successfully deleted'
    redirect_to questions_path
  end

  def index
    @questions = Question.all
  end

  private
    def set_question
      @question = Question.find(params[:id])  
    end

    def question_params
      params.require(:question).permit(:question, :name, :stay_anonymous)
    end
end
