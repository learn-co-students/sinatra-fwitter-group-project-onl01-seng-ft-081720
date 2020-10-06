class TweetsController < ApplicationController


    get '/tweets' do
        if Helpers.is_logged_in?(session)
            @tweets = Tweet.all
            erb :"/tweets/index"
        else
            redirect '/users/login'
        end
    end

    get '/tweets/new' do
        if Helpers.is_logged_in?(session)
            @tweets = Tweet.all
            erb :"/tweets/new"
        else
            redirect '/users/login'
        end
    end

    post '/tweets' do
        if !params["content"].empty?
            @tweet = Tweet.create(:content => params["content"])
            @tweet.user_id = session[:user_id]
            @tweet.save
        else
            redirect '/tweets/new'
        end
    end

    get '/tweets/:id' do
        if Helpers.is_logged_in?(session)
            @tweet = Tweet.find_by(id: params[:id])
            erb :"/tweets/show"
        else
            redirect '/login'
        end
    end

    get '/tweets/:id/edit' do
        @tweet = Tweet.find_by(id: params[:id])
        if Helpers.is_logged_in?(session)
                erb :"/tweets/edit"
        else
            redirect '/login'
        end
    end

    patch '/tweets/:id' do
        @tweet = Tweet.find_by(id: params[:id])
        if Helpers.is_logged_in?(session) && !params[:content].empty?
            @tweet.content = params[:content]
            @tweet.save
            redirect "/tweets/#{@tweet.id}"
        elsif params[:content].empty?
            redirect "/tweets/#{@tweet.id}/edit"
        else
            redirect '/login'
        end
    end

    delete '/tweets/:id/delete' do
        @tweet = Tweet.find_by(id: params[:id])
        if Helpers.is_logged_in?(session) && @tweet.id == session[:user_id]
            @tweet.delete
        end
    end

end
