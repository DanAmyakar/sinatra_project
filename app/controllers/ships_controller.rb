class ShipsController < ApplicationController

    get '/captains/ships/new' do
        redirect_if_not_signed_in
        erb :'ships/new'
    end

    post '/captains/ships' do
        redirect_if_not_signed_in
        if Ship.valid_params?(params)
            @ship = Ship.create(params)
            current_captain.ships << @ship
            erb :'ships/show'
        else
            redirect 'ships/new'
        end
    end
    
    get '/captains/ships/:id' do
        redirect_if_not_signed_in
        @ship = Ship.find(params["id"])
        erb :'ships/show'
    end
    
    
end