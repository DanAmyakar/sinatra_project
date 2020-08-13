# Controller for users specifically.

class CaptainsController < ApplicationController

    get '/create_account' do
        erb :'captains/create_account'
    end

    post '/captains' do 
        captain = Captain.new(params)
        captain.save
        session[:captain_id] = captain.id    
        if session[:captain_id] != nil
            redirect "/captains/#{captain.id}"
        else
            redirect '/create_account'
        end
    end

    get '/sign_in' do
        erb :'captains/sign_in'
    end

    post '/sign_in' do
        captain = Captain.find_by(captain_name: params[:captain_name])
        if captain && captain.authenticate(params[:password])
            session[:captain_id] = captain.id
            redirect "/captains/#{captain.id}"
        else
            redirect '/sign_in'
        end
    end

    get '/captains/:id' do
        if signed_in?
            current_captain
            erb :'/captains/show'
        else
            redirect to '/sign_in'
        end
    end

    delete '/sign_out' do
        session.destroy
        redirect '/'
    end
    
end