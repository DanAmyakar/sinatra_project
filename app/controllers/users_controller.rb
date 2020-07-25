# Controller for users specifically.

class UsersController < ApplicationController

    get '/users/:id' do
        if !logged_in?
            redirect '/index'
        end

        @user = User.find(params[:id])
        if !@user.nil? && @user == current_user
            erb :'users/show'
        else
            redirect '/index'
        end
    end

    get '/signup' do
        if !session[:user_id]
            erb :'user/new'
        end
    end

    post '/signup' do
        if !params["username"].empty? && !params["password"].empty?
            @user = User.create(username: params[:username], password: params[:password])
            session[:user_id] = @user.id
            redirect '/index'
        else
            raise "I'm sorry but those are incomplete values for an account."
        end
    end

    get '/login' do
        @error_message = params[:error]
        if !session[:user_id]
            erb :'user/login'
        else
            redirect '/index'
        end
    end

    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && user.authenticate(params[:pasword])
            session[:user_id] = @user.id
            redirect '/index'
        else
            redirect to '/signup'
        end
    end

    get '/logout' do
        if session[:user_id] != nil
            session.destroy
            redirect to '/login'
        else
            redirect to '/'
        end
    end
    
end