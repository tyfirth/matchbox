class PlayersController < ApplicationController

  get '/players' do
    @players = Player.all
    erb :'/players/index'
  end

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
      motto: params[:motto]
    )
    @player.save
    redirect :"/players/#{@player.id}"
  end


  get '/players/:id' do
    @player = Player.find(params[:id])
    erb :'/players/show'
  end

  get '/players/:id/edit' do
    @player = Player.find(params[:id])

    erb :'/players/edit'
  end

  patch '/players/:id' do
    @player = Player.find(params[:id])
    @player.update(params[:player])

    redirect to "/players/#{@player.id}"
  end

  delete '/players/:id' do
    @player = Player.find(params[:id])
    @player.delete
    redirect to '/players'
  end


end
