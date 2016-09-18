class SignupController < ApplicationController
  def validate
  end
  def verify
  	@user_name = params[:userName]
  	found_user = Authenticate.find_by(username: @user_name)
  	if found_user.nil?
  		flash[:notice] = "User not found"
  		redirect_to signup_validate_path, :alert => "You are not authorised"
  	else
  		@title = Title.all
  		render 'questions/show_all'
  	end
  end
end
