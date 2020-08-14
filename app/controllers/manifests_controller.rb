class ManifestsController < ApplicationController

    # gets the form for a new manifest
    get '/manifests/new' do 
        redirect_if_not_signed_in
        erb :'manifests/new'
    end

    # creates a new manifest from form data and stores it in the ship
    post "/captains/ships/:id" do
        redirect_if_not_signed_in
        @manifest = @current_ship.manifests.new(params)
        redirect '/ships/:id'
    end

end