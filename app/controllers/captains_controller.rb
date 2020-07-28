# Controller for users specifically.

class CaptainsController < ApplicationController

    get '/captains/:id' do
        if !logged_in?
            redirect '/index'
        end

        @captain = Captain.find(params[:id])
        if !@captain.nil? && @captain == current_user
            erb :'captains/show'
        else
            redirect '/index'
        end
    end

    get '/signup' do
        if !session[:captain_id]
            erb :'captains/new'
        end
    end

    post '/signup' do
        if !params["captain_name"].empty? && !params["password"].empty?
            @captain = Captain.create(
                captain_name: params[:username], 
                password: params[:password]
            )
            session[:captain_id] = @captain.id
            redirect '/index'
        else
            raise "I'm sorry but those are incomplete values for an account."
        end
    end

    get '/login' do
        @error_message = params[:error]
        if !session[:captain_id]
            erb :'captains/login'
        else
            redirect '/index'
        end
    end

    post '/login' do
        captain = Captain.find_by(captain_name: params[:captain_name])
        if captain && captain.authenticate(params[:pasword])
            session[:captain_id] = @captain.id
            redirect '/index'
        else
            redirect to '/signup'
        end
    end

    get '/logout' do
        if session[:captain_id] != nil
            session.destroy
            redirect to '/login'
        else
            redirect to '/'
        end
    end
    
end