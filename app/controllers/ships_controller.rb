class ShipsController < ApplicationController

    # gets to new ship form
    get '/ships/new' do
        redirect_if_not_signed_in
        erb :'ships/new'
    end

    # creates a new ship from form info
    post '/ships' do
        binding.pry
        redirect_if_not_signed_in
        @ship = current_captain.ships.new(params)
        @ship.save
        if @ship.id != nil
            redirect "/ships/#{@ship.id}"
        else
            redirect 'ships/new'
        end
    end

    # gets a ships info page
    get '/ships/:id' do
        redirect_if_not_signed_in
        @ship = current_captain.ships.find_by_id(params[:id])
        if @ship
            erb :'ships/show'
        else
            redirect "/captains/#{current_captain.id}"
        end
    end
    
    # gets the form to write new info to a ship
    get '/ships/:id/edit' do
        redirect_if_not_signed_in
        @ship = current_captain.ships.find_by_id(params[:id])
        erb :'/ships/edit'
    end

    # writes new info for a ship
    patch '/ships/:id/' do
        binding.pry
        @ship = current_captain.ships.find_by_id(params[:id])
        @ship.update(ship_name: params[:ship_name], cargo_slots: params[:cargo_slots])       
        erb :"/ships/show"
    end

    
    #detroy method for a ship
    delete '/ships/:id' do
        redirect_if_not_signed_in
        @ship = current_captain.ships.find_by_id(params[:id])
        if @ship
            @ship.destroy
        end
        redirect "/captains/#{current_captain.id}"
    end

end