class PasswordsController < ApplicationController
    
    
    def new
    end


    def create
        @user = User.find_by(email: params[:passwords][:email])
    end


    def edit_password
    end

    def update_password
        if @user.authenticate(params[:user][:current_password]) && 
            @user.update(password: params[:user][:new_password],
                        password_confirmation: params[:user][:new_password_confirmation])
            redirect_to root_path, notice: 'Senha alterada'
        else
            flash.now[:alert] = 'senha incorreta'
            render :edit_password
        end
    end

end