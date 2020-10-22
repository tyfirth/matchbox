ENV['SINATRA_ENV'] ||= "development"
ENV['RACK_ENV'] ||= "development"

require "bundler/setup"
require "sinatra/activerecord"



Bundler.require
Bundler.require(:default, ENV['SINATRA_ENV'])

connection_details = {
  :adapter => "sqlite3",
  :database => "db/matchbox.sqlite"
}
ActiveRecord::Base.establish_connection(connection_details)

require_all 'app/controllers/'
require_all 'app/models/'
require_all 'app/views/'
require_all 'app/views/matches/'
require_all 'app/views/players/'
