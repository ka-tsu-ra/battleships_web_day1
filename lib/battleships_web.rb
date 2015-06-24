require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :index
  end

  get '/start' do
    $game = Game.new Player, Board
    @visitor = params[:name]
    erb :start
  end

  get '/getboard' do
    @board = $game.own_board_view $game.player_1
    erb :getboard
  end

  post '/placeship' do
      @shiptype = params[:shiptype]
      @coord = params[:coord]
      $game.player_1.place_ship @shiptype, @coord
      redirect '/getboard'
  end

  run! if app_file == $0
end
