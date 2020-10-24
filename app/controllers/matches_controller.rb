class MatchesController < ApplicationController

##All Matches

  get '/matches' do
    @matches = Match.all
    erb :'/matches/index'
  end

  #------------------------------------------#
  ##Create Match

  get '/matches/new' do
    @match = Match.new
    @players = Player.all
    #binding.pry
    erb :'/matches/new'
  end

  post '/matches' do
    @winner = Player.find_by(name: params[:winner])
    binding.pry
    @match = Match.create(
      name: params[:name],
      winner: @winner.name,
      score: params[:score]
    )

    @match[:player_id] = @winner.id
    binding.pry
    @match.save
    redirect :"/matches/#{@match.id}"
  end
#------------------------------------------#
  ##Show Match Record

  get '/matches/:id' do
    if !logged_in?
      erb :error
    else
    @match = Match.find(params[:id])
    erb :'/matches/show'
  end
  end

#------------------------------------------#
  ##Edit Match Record

  get '/matches/:id/edit' do
    @match = Match.find(params[:id])
      if current_user.id == @match.player_id
        erb :'/matches/edit'
      else
        erb :error
      end
  end

  patch '/matches/:id' do
    @match = Match.find(params[:id])
    @match.update(params[:match])

    redirect to "/matches/#{@match.id}"
  end

#------------------------------------------#

  ##Delete Match Record

  delete '/matches/:id' do
    @match = Match.find(params[:id])
    @match.delete
    redirect to '/matches'
  end


end
