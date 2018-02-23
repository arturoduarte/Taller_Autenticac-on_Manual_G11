class SessionsController < ApplicationController
	def new
		@user = User.new
	end
	
	def create
		@user = User.find_by(email: params[:user][:email])
		
		if @user.present?
			if @user.password == (params[:user][:password])
				session[:user_id] = @user.id
				redirect_to root_path, notice: 'Has ingresado'
			else
				redirect_to root_path, alert: 'Tus credenciales no son válidas'
			end
		else
			redirect_to root_path, alert: 'Tus credenciales no son válidas'
		end
	end
	
	def destroy
		reset_session
		redirect_to root_path, notice: 'Has cerrado sesión con éxito'
	end
	
end
