class ApplicationController < Sinatra::Base

  configure do
  set :views, "app/views"
  set :public_dir, "public"

  enable :sessions
  set :session_secret, "IYAMAwesome123!"
  
  end

  get "/" do
    erb :index
  end


end
