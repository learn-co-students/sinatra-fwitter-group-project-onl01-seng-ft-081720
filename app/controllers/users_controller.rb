class UsersController < ApplicationController

    get '/users/:slug' do
        @user = user.find_by_slug(params[:slug])
        erb :"users/show"
    end


    get '/signup' do
        if logged_in?
            redirect to "/tweets"
        else
        erb :"users/new"
        end
    end

    post '/signup' do
        @user = User.new(params)
        if @user && @user.save
        session[:user_id] = @user.id
        redirect to "/tweets"
        else  
            redirect to '/signup'
        end
    end

    get '/login' do
        if logged_in?
            redirect to "/tweets"
        else
        erb :"users/login"
        end
    end

    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect to "/tweets"
        else
        redirect to "/login"
        end
    end

    get '/logout' do
        if logged_in?
          session.destroy
          redirect to '/login'
        else
          redirect to '/'
        end
    end
end
