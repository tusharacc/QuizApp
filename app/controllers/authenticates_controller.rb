class AuthenticatesController < ApplicationController
	def create_user
		name = params[:authenticate][:username]
		pass = params[:authenticate][:password]

		logger.debug "I am here, my user id and password is #{name} and #{pass}"

		return_bool = Authenticate.create_user name,pass

		if return_bool 
			redirect_to '/signup/verify', :notice => "User created successfully"
		else
			redirect_to '/signup/verify', :alert => "User not created successfully"
		end
	end
end
