require 'sinatra'
require './lib/counter'

enable :sessions

get '/' do
  erb :index
end

get '/practice' do
  erb :practice
end

post '/practice' do
  session[:counter] = Counter.new(params[:decks].to_i)
  session[:min] = params[:min].to_i
  session[:max] = params[:max].to_i
  session[:delay] = params[:delay].to_i

  redirect '/practice'
end


