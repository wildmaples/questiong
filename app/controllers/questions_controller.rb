class QuestionsController < ApplicationController
    def new
        @question = Question.new
    end
    
    def create
        @question = Question.new(question_params)
        @question.save
    end     
    private

    def question_params
        params.require(:question).permit(:question, :name)
    end 

end 