class UsersController < ApplicationController

    def show
      user = User.find(params[:id])
      render json: user
    end

    def create
      hash = JSON.parse(request.body.read)
      @user = User.new(email:(hash["email"]), password:(hash["password"]), password_confirmation:(hash['password_confirmation']), sound:(hash['sound']), lon:(hash['lon']), lat:(hash['lat']))
      if @user.save
        render json: ({user:@user.id})
      else
        render json: @user.errors
      end
    end

    def update
      user = User.find(params[:id])
      hash = JSON.parse(request.body.read)
      user.update(lat:(hash["lat"]), lon:(hash["lon"]), sound:(hash["sound"]))
    end

    private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :sound, :lon, :lat)
      end

  end
