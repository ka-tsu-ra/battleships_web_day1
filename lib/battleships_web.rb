require 'sinatra/base'
# require 'Battleships_web'

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
    $coord = params[:cell]
    erb :getboard
  end

  get '/shoot' do
    $coord = params[:cell]
    erb :shoot
  end

  run! if app_file == $0
end
