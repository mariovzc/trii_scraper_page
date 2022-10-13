require 'sinatra'
require "sinatra/reloader"
require './trii_scraper'

configure :production do
  enable :reloader
end

get '/' do
  @stocks = get_page()
  erb :index
end
