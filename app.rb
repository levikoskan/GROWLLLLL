require 'sinatra'
require 'sinatra/reloader'
require_relative 'user'


enable :sessions


before do
  session[:growl] ||= []
end

# Routes
get '/' do
  erb :loggin
end


get '/home' do
  @feed = session[:growl]
  @user = params[:fname].capitalize!
  @fname = params[:lname].upcase!
  erb :index
end

get '/error' do
  erb :error
end


post '/home' do
  @item = params[:human_growl]
  @feed_length = @item.split("")

  if @feed_length.length > 141 || @feed_length.empty? || @feed_length[0] == " "
      redirect '/error'
  else

  session[:growl].push @item
  redirect '/home'
  end


end


