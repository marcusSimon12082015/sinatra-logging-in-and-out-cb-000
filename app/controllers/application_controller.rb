require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params[:username], password: params[:password])
    binding.pry
    if @user.nil?
      erb :error
    else
      session[:user_id] = @user.id
      redirect to '/account'
    end
  end

  get '/account' do
    @user = User.find(session[:user_id])
    erb :account
  end

  get '/logout' do

  end


end
