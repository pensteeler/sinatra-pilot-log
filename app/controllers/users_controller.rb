class UsersController < ApplicationController

  get '/users/:id' do

  end

  get '/signup' do

    if logged_in?
      redirect '/airplanes'
    else
      erb :'users/signup'
    end

  end

  post '/signup' do

    if params[:username] == "" || params[:password] == "" || params[:email] == ""
      redirect '/signup'
    else
      @user = User.create( email: params[:email], username: params[:username], password: params[:password])
      session[:user_id] = @user.id
      redirect '/airplanes'
    end

  end

  get '/login' do

  end

  post '/login' do

  end

  get '/logout' do

  end

end
