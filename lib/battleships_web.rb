require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :index
  end

  get '/start' do
    @visitor = params[:name]
    erb :start
  end

  get '/getboard' do
    $game = Game.new Player, Board
    @board = $game.own_board_view $game.player_1
    erb :getboard
  end

  post '/placeship' do
    
    @coord = params[:coord]
    redirect:placeship

  end

  get '/getboard' do
    game.player_1.place_ship Ship.battleship, :A5

  end




  # get '/shoot' do
  #   $coord = params[:cell]
  #   erb :shoot
  # end



  run! if app_file == $0
end
