
class UsersController < ApplicationController

    def show
      user = User.find(params[:id])
      render json: user
    end

    def index
      @users = User.all
      render json: @users
    end

    def create
      hash = JSON.parse(request.body.read)
      @user = User.new(email:(hash["email"]), password:(hash["password"]), password_confirmation:(hash['password_confirmation']), sound:(hash['sound']), lon:(hash['lon']), lat:(hash['lat']))
      if @user.save
        session[:user_id] = @user.id
        render json: ({user:@user.id})
      else
        render json: @user.errors
      end
    end

    def update
      @user = User.find(params[:id])
      hash = JSON.parse(request.body.read)
      p hash
      @user.update(lat:(hash["lat"]))
      @user.update(lon:(hash["lon"]))
      @user.update(sound:(hash["sound"]))
      @lon = @user.lon.to_f
      @lat = @user.lat.to_f
      @total = []
      user2_coords
      coord_to_calc(@lon, @lat, user2_coords[0], user2_coords[1])
    end

    def user1_coords
      @array = []
      @user1 = User.find(53)
      @array << @lat
      @array << @lon
      @total << @array
    end

    def user2_coords
      @array2 = []
      @user2 = User.find(52)
      @array2 << @user2.lon.to_f
      @array2 << @user2.lat.to_f
      @array2
    end

    def total
      @total
    end

    def coord_to_calc(lat1, lon1, lat2, lon2)
      d = Haversine.distance(lat1, lon1, lat2, lon2)
      final = d.to_m
      close?(final)
    end

    def close?(number)
      if number <= 20000 || final >= -200000
        @user1.foreign_url = @user2.sound
      end
    end

    private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :sound, :lon, :lat)
      end






  end


  # user1 = User.find(params[:id])
  # coord1 = user1.lat
  # coord2 = user1.lon
  #
  # users = User.all?
  # rest = users.delete(user1)
  # rest.each do |user|
  #
  # end
