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
      coord = params[:coord].to_sym
      direction = params[:direction].to_sym
      shiptype = params[:shiptype]
      ship = Ship.new(shiptype)
    begin
      $game.player_1.place_ship ship, coord, direction
    rescue
      @error = 'Invalid coordinate'
    end
    @board = $game.own_board_view $game.player_1
    erb :getboard
  end

  run! if app_file == $0
end
