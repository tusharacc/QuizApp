class SignupController < ApplicationController
  def validate
  end
  def verify
  	@user_name = params[:username]
    @password = params[:password]
  	found_user = Authenticate.get_user_by_name(@user_name)
    #logger.debug "hi I am #{found_user.authenticate(@password)}"
    if session[:user].nil?
  	  if found_user && found_user.authenticate(@password)
        session[:user] = found_user.id
        if @user_name == 'Admin' || @user_name =='admin'
          render 'admin_screen'
        else
          @title = Title.get_all_title
          render 'questions/show_all'
        end
  	  else
        redirect_to root_path, :alert => "Wrong Userid or Password"
  	  end
    else
      get_user = Authenticate.get_user_by_id(session[:user])
      if get_user.username == 'Admin' 
          render 'admin_screen'
      else
          @title = Title.get_all_title
          render 'questions/show_all'
      end
    end
  end
  
  def create_user
    @user = Authenticate.new
  end
  #private
  #def user_params
  #  params.require(:user).permit(:username,  :password)
  #end
end
