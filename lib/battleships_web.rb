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
    @board1 = $game.own_board_view $game.player_1
    # @board2 = $game.own_board_view $game.player_2
    erb :getboard
  end

  post '/placeship' do
      coord = params[:coord].to_sym
      direction = params[:direction].to_sym
      shiptype = params[:shiptype]
      ship = Ship.new(shiptype)
    begin
      $game.player_1.place_ship ship, coord, direction
    rescue
      @error = 'Invalid coordinate'
    end
    @board1 = $game.own_board_view $game.player_1
    erb :getboard
  end

  get '/firing' do
    @board2 = $game.opponent_board_view $game.player_1
    erb :firing
  end

  post '/actually_firing' do
    coordinate = params[:coordinate].to_sym
    $game.player_1.shoot coordinate
    #@board2 = $game.opponent_board_view $game.player_1
    redirect '/firing'
  end

  run! if app_file == $0
end
