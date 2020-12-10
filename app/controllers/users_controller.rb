class UsersController < ApplicationController

    get '/signup' do
        # binding.pry
        if logged_in?
            redirect '/tweets'
        end
        erb :'users/signup'
      end
    
      post "/signup" do
        # binding.pry
        if params.all?{|k, v| v!=""}
            user = User.create(params)
            session[:user_id] = user.id
            redirect '/tweets'
        else  
            redirect '/signup'
        end
      end 

      
end
