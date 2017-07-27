class AirplanesController < ApplicationController

  get '/airplanes' do

    if logged_in?
      @user = User.find_by( id: session[:user_id] )
      @airplanes = @user.airplanes
      #@airplanes = Airplane.all
      erb :'airplanes/index'
    else
      redirect '/login'
    end

  end

  post '/airplanes' do

    if params[:type] == "" || params[:tail_number] == ""
      redirect '/airplanes/new'
    else
      @airplane = current_user.airplanes.create( manufacturer: params[:manufacturer], aircraft_type: params[:aircraft_type], tail_number: params[:tail_number], last_flight: params[:last_flight], last_checkout: params[:last_checkout], time_in_type: params[:time_in_type], comments: params[:comments] )

      redirect "/airplanes/#{@airplane.id}"
    end

  end

  get '/airplanes/new' do

    if logged_in?
      erb :'airplanes/new'
    else
      redirect '/login'
    end

  end

  get "/airplanes/:id" do

    if logged_in?
      @airplane = Airplane.find_by_id( params[:id] )
      erb :'airplanes/show'
    else
      redirect '/login'
    end

  end

  post '/airplanes/:id' do

    if logged_in?
      @airplane = Airplane.find_by_id( params[:id] )

      @airplane.manufacturer = params[:manufacturer]
      @airplane.aircraft_type = params[:aircraft_type]
      @airplane.tail_number = params[:tail_number]
      @airplane.time_in_type = params[:time_in_type]
      @airplane.last_flight = params[:last_flight]
      @airplane.last_checkout = params[:last_checkout]
      @airplane.comments = params[:comments]

      @airplane.save

      redirect "/airplanes/#{@airplane.id}"
    else
      redirect '/login'
    end

  end

  get "/airplanes/:id/edit" do

    if logged_in?
      @airplane = Airplane.find_by_id( params[:id] )
      if @airplane.user_id == current_user.id
        erb :"airplanes/edit"
      else
        redirect "/airplanes"
      end
    else
      redirect "/login"
    end

  end


end
