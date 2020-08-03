class ManifestsController < ApplicationController

    # gets the form for a new manifest
    get '/captains/ships/manifests/new' do 
        redirect_if_not_signed_in
        "This option is temporarily unavailable"
        #erb :'manifests/new'
    end

    # creates a new manifest from form data and stores it in the ship
    post "/captains/ships/:id" do
        redirect_if_not_signed_in
        @manifest = Manifest.create(params)
        Ship.find(params["id"]).manifests << @manifest
        redirect '/captains/ships/:id'
    end

end