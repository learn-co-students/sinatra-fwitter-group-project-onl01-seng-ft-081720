class TweetsController < ApplicationController

      get "/tweets" do
        if logged_in?
          @tweets = Tweet.all
          erb :'tweets/tweets'
        else
          redirect to '/login'
        end      
      end
      
      get "/tweets/new" do
        erb :"tweets/new"
      end
      
      post "/tweets" do
        
      end
      
      get "/tweets/:id" do
        erb :"tweets/show"
      end
      
      get "/tweets/:id/edit" do
      
        erb :"tweets/edit"
      end
      
      post "/tweets/:id" do
        
      end
      
      delete "/tweets/:id/delete" do
        
      end

end
