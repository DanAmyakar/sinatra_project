class ShipsController < ApplicationController

    # gets to new ship form
    get '/ships/new' do
        redirect_if_not_signed_in
        erb :'ships/new'
    end

    # creates a new ship from form info
    post 'captains/ships' do
        redirect_if_not_signed_in
        if Ship.valid_params?(params)
            @ship = Ship.create(params)
            current_captain.ships << @ship
            erb :'ships/show'
        else
            redirect 'ships/new'
        end
    end
    
    # gets the form to write new info to a ship
    get '/captains/ships/:id/edit' do
        redirect_if_not_signed_in
        @ship_to_edit = Ship.find(params[:id])
        erb :'/ships/edit'
    end

    # writes new info for a ship
    patch '/captains/ships/:id' do
        redirect_if_not_signed_in
        Ship.update(params[:id], ship_name: params[:ship_name], cargo_slots: params[:cargo_slots])
        @ship = Ship.find(params[:id])
        erb :'ships/show'
    end

    # gets a ships info page
    get '/captains/ships/:id' do
        redirect_if_not_signed_in
        @ship = Ship.find(params["id"])
        erb :'ships/show'
    end
    
    #detroy method for a ship
    delete '/captains/ships/:id' do
        redirect_if_not_signed_in
        Ship.delete(params[:id])
        redirect '/captains/ships'
    end
end