require 'sinatra'
require 'sinatra/reloader'

enable :sessions #can't use sessions without this


before do
  session[:growl] ||= []

end

# Routes
get '/' do

	erb :index


end

get '/growl' do
  @feed = session[:growl]
  erb :growl

end

get '/add' do
  erb :add

end

post '/add' do
  item = params[:human_growl]
  session[:growl].push item

  redirect '/'

end
