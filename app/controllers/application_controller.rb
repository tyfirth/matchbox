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

  get '/sessions/login' do
    erb :'/sessions/login'
  end

  post '/login' do
    @player = Player.find_by(name: params[:name])

    if @player && @player.authenticate(params[:password])
      session[:player_id] = @player.id

      redirect to "/players/#{@player.id}"
    end
    erb :error
  end

  get '/logout' do
  session.clear
  redirect to '/'
end

  helpers do
    def current_user
     current_user ||= Player.find(session[:player_id]) if session[:player_id]
    end

    def logged_in?
      !!current_user
  end
end

end
