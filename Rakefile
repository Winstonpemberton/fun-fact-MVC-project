ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :environment do
  require_relative './config/environment'
  require './app/scraper/scraper.rb'
end

desc 'drop into the Pry console'
task :scraper => :environment do
  Scraper.scrape_main_page
end
