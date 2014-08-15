require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require 'pry'
require './lib/history_scraper.rb'

get '/' do
  @history = History.new
  erb :index
end

get '/random_event' do
  @history = History.new
  erb :random 
end

