require 'rubygems'
require 'bundler'
	Bundler.setup
require 'sinatra'
require 'json'
require 'rest-client'

get '/' do
	'main'
	api_result = RestClient.get 'http://localhost/4000'
	puts api_result
end