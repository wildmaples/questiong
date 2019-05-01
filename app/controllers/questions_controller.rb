class QuestionsController < ApplicationController
    def new
        @question = Question.new
    end
    
    def create           
        @question = Question.new(question_params)
        if @question.save
            flash[:notice] = "Question was successfully created"
            redirect_to question_path(@question)
        else
            byebug
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
            flash[:notice] = "Your question was successfully updated 🙌"
            redirect_to question_path(@question)
        else
            render 'edit'
        end
    end        

    private

    def question_params
        params.require(:question).permit(:question, :name, :stay_anonymous)
    end 

end 