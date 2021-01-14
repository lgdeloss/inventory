class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @items = @user.items
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice]= "Your account info was succesfully updated"
            redirect_to items_path
        else
            render 'edit'
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to IA #{@user.username}, you have succesfully signed up"
            redirect_to items_path
        else
            render 'new'
        end
    end

    private
    def user_params
        params.require(:user).permit(:username,:email,:password)
    end
end