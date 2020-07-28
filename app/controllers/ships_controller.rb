class ShipsController < ApplicationController

    get '/ships' do
        @captain = current_user
        erb :'ships/index'
    end

end