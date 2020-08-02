class ShipsController < ApplicationController

    get '/ships/new' do
        redirect_if_not_signed_in
        erb :'ships/new'
    end

    post '/ships' do
        redirect_if_not_signed_in
        if Ship.valid_params?(params)
            @ship = Ship.create(params)
            current_captain.ships << @ship
            erb :'ships/show'
        else
            redirect 'ships/new'
        end
    end
    
    #edit method for a ship
    #edit form contains item lines equal to the cargo slots of a ship
    # submit writes all the item lines to the ships page
    get '/ships/:id/edit' do
        @ship_to_edit = Ship.find(params[:id])
        erb :'/ships/edit'
    end

    patch '/ships/:id' do
        Ship.update(params[:id], ship_name: params[:ship_name], cargo_slots: params[:cargo_slots])
        @ship = Ship.find(params[:id])
        erb :'ships/show'
    end

    get '/ships/:id' do
        redirect_if_not_signed_in
        @ship = Ship.find(params["id"])
        erb :'ships/show'
    end
    
    #detroy method for a ship
    
end