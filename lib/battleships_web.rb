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
  endrspec

  get '/getboard' do
    $game = Game.new Player, Board
    erb :getboard
  end

  # get '/shoot' do
  #   $coord = params[:cell]
  #   erb :shoot
  # end

  run! if app_file == $0
end
