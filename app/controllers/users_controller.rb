class UsersController < ApplicationController

      get "/signup" do
        if logged_in?
          redirect to "/tweets"
        else
          erb :"users/create_user"
        end
      end
      
      post "/signup" do
        
        if params[:username] != "" && params[:email] != "" && params[:password] != "" 
          user= User.create(params)
          session[:user_id]=user.id
          redirect to "/tweets"
        else 
          redirect to "/signup"
        end

      end
      
      get "/login" do
        
      end
      
      post "/login" do
        
      end
      
      get "/logout" do
        session.clear
		    redirect "/"
      end

end
