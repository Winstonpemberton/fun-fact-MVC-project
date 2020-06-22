
require 'bundler/setup'
Bundler.require
require_all './app'
require_relative '../app/models/concerns/slugifiable.rb'

ENV['SINATRA_ENV'] ||= "development"

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_relative "../app/controllers/application_controller.rb"
