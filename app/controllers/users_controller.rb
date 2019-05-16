# frozen_string_literal: true

class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])       
    end    
        
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Your account was successfully created! Welcome, #{@user.username} 😇"
            redirect_to questions_path
        else
            render 'new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)  
     end        
end 