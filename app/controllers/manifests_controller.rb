class ManifestsController < ApplicationController

    get "/manifest/new" do 
        erb :'manifests/new.erb'
    end

    post "ships/:id" do

    end

end