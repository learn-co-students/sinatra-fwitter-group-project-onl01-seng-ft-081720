require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do 
    erb :index
  end

  get '/signup' do
    if Helpers.is_logged_in?(session)
      redirect '/tweets'
    end
    
    erb :signup
  end

  post '/signup' do
    if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect '/tweets'
    else 
      redirect '/signup'
    end
  end

  get '/login' do
    if Helpers.is_logged_in?(session)
      redirect '/tweets'
    end

    erb :"/login"
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user
      session[:user_id] = @user.id
      redirect '/tweets'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    if Helpers.is_logged_in?(session)
      session.clear
      redirect '/login'
    else
      redirect '/'
    end

    erb :"/tweets/index"
  end


end
