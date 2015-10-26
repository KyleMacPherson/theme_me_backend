class SoundsController < ApplicationController

  def index
    @sounds = Sound.all
    render json: @sounds
  end

  def create
    @sound = Sound.new(sound_params)
    if @sound.save
      render json: @sound
    else
      render json: @sound.errors
    end
  end

  def show
    @sound = Sound.find(params[:id])
    render json: @sound
  end

  # def update
  #   if @sound.update(sound_params)
  #     head :no_content
  #   else
  #     render json: @sound.errors
  #   end
  # end
  #
  # def destroy
  #   @sound.destroy
  # end

  def sound_params
   params.require(:sound).permit(:url)
 end

end
