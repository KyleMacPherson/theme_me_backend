class UsersController < ApplicationController

    def show
      @user = User.find(params[:id])
      render json: @user
    end

    def create
      hash = JSON.parse(request.body.read)
      @user = User.new(email:(hash["email"]), password:(hash["password"]), password_confirmation:(hash['password_confirmation']))
      if @user.save
        render json: @user
      else
        render json: @user.errors
      end
    end

    private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end

  end
