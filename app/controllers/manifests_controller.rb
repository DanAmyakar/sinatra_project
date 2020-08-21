class ManifestsController < ApplicationController

    # gets the form for a new manifest
    get '/manifests/new' do 
        redirect_if_not_signed_in
        puts params
        @ship = current_captain.ships.find_by_id(params[:ship_id])
        #binding.pry
        erb :'manifests/new'
    end

    # creates a new manifest from form data and stores it in the ship
    post "/ships/:id" do
        redirect_if_not_signed_in
        puts params
        #binding.pry
        params[:ship_id] = params[:id]
        @manifest = current_captain.ships.find_by_id(params[:ship_id]).manifests.new(item_name: params[:item_name], item_quantity: params[:item_quantity])
        if @manifest.save
            redirect "/ships/#{@manifest.ship.id}"
        else
            redirect "ships/#{current_captain.ships.find_by_id(params[:ship_id])}"
        end
    end

    get "/manifests/:id/edit" do
        @manifest_to_edit = @current_ship.manifests.find_by_id(params)
        erb :'/manifest/edit'
    end

    patch "/ships/:id" do
    end

    #delete selected manifest 

end