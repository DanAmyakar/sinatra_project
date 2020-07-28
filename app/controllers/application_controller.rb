require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  get '/' do
    erb :welcome
  end

  helpers do 
    def redirect_if_not_signed_in
      if !logged_in?
        redirect "/sign_in?error=You have to sign in to do that."
      end
    end

    def signed_in?
      !!session[:captain_id]
    end

    def current_captain
      Captain.find(session[:captain_id])
    end
  end

end
