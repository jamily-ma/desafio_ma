class UsersController < ApplicationController

    def edit
    end

    def update
      if @user.update(user_params)
        redirect_to @user, notice: 'Cadastro atualizado'
      else
        render :edit
      end
    end

    private

    def user_params
        params.require (:user).permit(:name, :email)
    end

    def index
      @users = User.all
    end
    def show
      
      @user = current_user
    end
  end