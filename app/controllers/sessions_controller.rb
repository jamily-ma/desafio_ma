class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email])

		if user && user.authenticate(params[:session][:password])
			log_in user
			redirect_to root_path, notice: 'login efetuado'
		else
            flash.now[:alert] = 'Email ou senha incorreta'
			render :new
		end
	end
	

	def destroy 
        log_out
	    endredirect_to root_path, notice: 'login efetuado'
    end

end