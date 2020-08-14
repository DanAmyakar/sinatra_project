class ManifestsController < ApplicationController

    # gets the form for a new manifest
    get '/manifests/new' do 
        redirect_if_not_signed_in
        @ship = current_captain.ships.find_by_id(params[:ship_id])
        #binding.pry
        erb :'manifests/new'
    end

    # creates a new manifest from form data and stores it in the ship
    post "/ships/:id" do
        redirect_if_not_signed_in
        #binding.pry
        @manifest = current_captain.ships.find_by_id(params[:id]).manifests.create(params)
        redirect '/ships/:id'
    end

    get "/manifests/:id/edit" do
        @manifest_to_edit = @current_ship.manifests.find_by_id(params)
        erb :'/manifest/edit'
    end

    patch "/ships/:id" do
    end

end