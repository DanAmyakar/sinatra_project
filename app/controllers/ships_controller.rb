class ShipsController < ApplicationController

    # gets to new ship form
    get '/ships/new' do
        redirect_if_not_signed_in
        erb :'ships/new'
    end

    # creates a new ship from form info
    post '/ships' do
        redirect_if_not_signed_in
        @ship = current_captain.ships.new
        @ship.save
        if 
            erb :'ships/show'
        else
            redirect 'ships/new'
        end
    end
    
    # gets the form to write new info to a ship
    get '/ships/:id/edit' do
        redirect_if_not_signed_in
        @ship_to_edit = current_captain.ships.find_by_id(params[:id])
        erb :'/ships/edit'
    end

    # writes new info for a ship
    patch '/ships/:id' do
        redirect_if_not_signed_in
        Ship.update(ship_name: params[:ship_name], cargo_slots: params[:cargo_slots])
        @ship = current_captain.ships.find_by_id(params[:id])
        erb :'ships/show'
    end

    # gets a ships info page
    get '/ships/:id' do
        redirect_if_not_signed_in
        @ship = current_captain.ships.find_by_id(params[:id])
        erb :'ships/show'
    end
    
    #detroy method for a ship
    delete '/ships/:id' do
        redirect_if_not_signed_in
        current_captain.ships.find_by_id(params).destroy
        redirect '/ships'
    end

end