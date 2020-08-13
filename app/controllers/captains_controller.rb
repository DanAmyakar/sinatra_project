# Controller for users specifically.

class CaptainsController < ApplicationController

    get '/create_account' do
        erb :'captains/create_account'
    end

    post '/captains' do
        if params[:captain_name] != "" && params[:password] != ""
            @captain.save if @captain.valid
            redirect '/captains/#{@captain.id}'
        else
            redirect '/captains/create_account'
        end
    end

    

    get '/sign_in' do
        erb :'captains/sign_in'
    end

    post '/sign' do
        captain = Captain.find_by(captain_name: params[:captain_name])
        if captain && captain.authenticate(params[:password])
            session[:captain_id] = captain.id
            redirect '/captains/:id'
        else
            redirect '/sign_in'
        end
    end


    get '/captains/:id' do
        if signed_in?
            @captain = current_captain
            erb :'/captains/show'
        else
            redirect to '/sign_out'
        end
    end

    get '/sign_out' do
        !session[:captain_id].nil?
        session.destroy
        redirect '/'
    end
    
end