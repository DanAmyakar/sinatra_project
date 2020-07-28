# Controller for users specifically.

class CaptainsController < ApplicationController

    get '/captains/create_account' do
        erb :'captains/create_account'
    end

    post '/captains/create_account' do
        if params[:captain_name] != "" && params[:password] != ""
            @captain = Captain.create(
                captain_name: params[:captain_name],
                password: params[:password]
            )
            session[:captain_id] = @captain.id
            redirect '/captains/"#{@captain.id}"'
        else
            redirect '/captains/create_account'
        end
    end

    get '/captains/:id' do
        @captain = current_captain
        erb :'/captains/show'
    end
    
end