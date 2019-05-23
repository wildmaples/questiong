# frozen_string_literal: true

class UsersController < ApplicationController
    before_action :set_user, only: [:show]
    before_action only: [:edit, :update] do
        require_same_user(@user)
      end

    def new
        @user = User.new
    end

    def show
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

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)  
     end        
end 