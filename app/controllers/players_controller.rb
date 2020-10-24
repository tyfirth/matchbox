class PlayersController < ApplicationController

##Players Home
  get '/players' do
    @players = Player.all
    erb :'/players/index'
  end

  ##Create New Player

  get '/players/new' do
    @player = Player.new
    erb :'/players/new'
  end

  post '/players' do
    #binding.pry
    @player = Player.new(
      name: params[:name],
      age: params[:age],
      favorite_game: params[:favorite_game],
      win_phrase: params[:win_phrase],
      lose_phrase: params[:lose_phrase],
      motto: params[:motto],
      password: params[:password]
    )
    #binding.pry
    @player.save
    session[:player_id] = @player.id
    redirect :"/players/#{@player.id}"
  end

#------------------------#
##Show Player's Record

  get '/players/:id' do
    if !logged_in?
      erb :error
    else
    @player = Player.find(params[:id])
    #binding.pry
    erb :'/players/show'
  end
  end

  #--------------------#
  ##Edit Player's Record

  get '/players/:id/edit' do
    @player = Player.find(params[:id])
    if current_user.id == @player.id
    #binding.pry
    erb :'/players/edit'
  else
    erb :error
  end
    #binding.pry

  end

  patch '/players/:id' do
    @player = Player.find(params[:id])
    #binding.pry
      @player.name = params[:name]
      @player.age = params[:age]
      @player.favorite_game = params[:favorite_game]
      @player.win_phrase = params[:win_phrase]
      @player.lose_phrase = params[:lose_phrase]
      @player.motto = params[:motto]
    #binding.pry
    @player.save
    redirect "/players/#{@player.id}"
  end

  #--------------------#
  ##Delete Player's Record

  delete '/players/:id' do
    @player = Player.find(params[:id])
    @player.delete
    redirect to '/players'
  end


end
