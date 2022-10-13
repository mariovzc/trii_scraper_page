require 'sinatra'
require "sinatra/reloader" if development?
require './server'

run Sinatra::Application
