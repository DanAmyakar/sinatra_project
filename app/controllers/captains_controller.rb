# Controller for users specifically.

class CaptainsController < ApplicationController

    get '/captains/:id' do
        redirect to "/" if !signed_in?
        
        @captain = Captain.find(params[:id])
        if !@captain.nil? && @captain == current_captain
            erb :'captain/show'
        else
            redirect to "/"
        end
    end

    get "/create_acount" do
        if !session[:captain_id]
            erb :'captains/create_account'
        else
            "You are already signed in."
        end
    end

    post "/create_account" do
        if !params["captain_name"].empty? && !params["password"].empty?
            @captain = Captain.create(
                captain_name: params[:username], 
                password: params[:password]
            )
            session[:captain_id] = @captain.id
            redirect "/"
        else
            "I'm sorry but those are incomplete values for an account."
        end
    end

    get '/sign_in' do
        @error_message = params[:error]
        if !session[:captain_id]
            erb :'captains/sign_in'
        else
            redirect '/'
        end
    end

    post '/sign_in' do
        captain = Captain.find_by(captain_name: params[:captain_name])
        if captain && captain.authenticate(params[:pasword])
            session[:captain_id] = captain.id
            redirect '/'
        else
            redirect to '/create_account'
        end
    end

    get '/sign_out' do
        session.destroy if session[:captain_id] != nil
        redirect to '/'
    end
    
end