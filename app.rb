require 'sinatra'
require 'sinatra/reloader'

enable :sessions #can't use sessions without this


before do
  session[:growl] ||= []

end

# Routes
get '/' do
  @feed = session[:growl]
  erb :index


end

get '/error' do
  erb :error
end

post '/' do
  @item = params[:human_growl]
  @feed_length = @item.split("")

  if @feed_length.length > 141 || @feed_length.empty? || @feed_length[0] == " "
      redirect '/error'
  else

  session[:growl].push @item
  redirect '/'
  end


end


