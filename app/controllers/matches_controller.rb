class MatchesController < ApplicationController

  get '/matches' do
    @matches = Match.all
    erb :'/matches/index'
  end

  get '/matches/new' do
    @match = Match.new
    @players = Player.all
    #binding.pry
    erb :'/matches/new'
  end

  post '/matches' do
    #binding.pry
    @match = Match.new(
      name: params[:name],
      winner: params[:winner],
      score: params[:score]
    )
    binding.pry
    @match.save
    redirect :"/matches/#{@match.id}"
  end

  get '/matches/:id' do
    @match = Match.find(params[:id])
    erb :'/matches/show'
  end

  get '/matches/:id/edit' do
    @match = Match.find(params[:id])
    erb :'/matches/edit'
  end

  patch '/matches/:id' do
    @match = Match.find(params[:id])
    @match.update(params[:match])

    redirect to "/matches/#{@match.id}"
  end

  delete '/matches/:id' do
    @match = Match.find(params[:id])
    @match.delete
    redirect to '/matches'
  end


end
