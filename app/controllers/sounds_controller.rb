class SoundsController < ApplicationController

  def index
    @sounds = Sound.all
    render json: @sounds
  end

  def create
    hash = JSON.parse(request.body.read)
    @sound = Sound.new(url:(hash["url"]))
    if @sound.save
      render json: @sound
    else
      render json: @sound.errors
    end
  end

  def show
    hash = JSON.parse(request.body.read)
    @sound = Sound.find(id:(hash["id"]))
    render json: @sound
  end

  def update
    hash = JSON.parse(request.body.read)
    @sound = Sound.find(id:(hash["id"]))
    if @sound.update(url:(hash["url"]))
      head :no_content
    else
      render json: @sound.errors
    end
  end

  def destroy
    sound = Sound.find(params[:id])
    sound.destroy
  end

  def sound_params
   params.require(:sound).permit(:url)
  end

end
