class UsersController < ApplicationController

    def show
      user = User.find(params[:id])
      render json: user
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
      user = User.find(params[:id])
      hash = JSON.parse(request.body.read)
      user.update(lat:(hash["lat"]))
      user.update(lon:(hash["lon"]))
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
