require 'sinatra'
require 'mongo'
require_relative 'lib/admin'

class AdminServer < Sinatra::Base
  set    :show_exceptions, false
  set    :raise_errors, false
  enable :sessions

  helpers Admin

  include Mongo

  configure do
    conn = MongoClient.new("localhost", 27017)
    set :mongo_connection, conn
    set :db, conn.db('bikebotser')
    # will to make connection from URL for production
  end

  get '/' do
    btok = settings.db['defaults'].find_one();
    if (btok.nil?)
      haml :first_signin
    else
      haml :signin
    end
  end

  get '/status' do
    Admin.status_msg
  end

  post '/login' do
    puts "ATTEMPTED LOGIN"
  end
end
