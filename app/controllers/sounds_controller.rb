class SoundsController < ApplicationController
  def index
    @sounds = Sound.all
    render json: @contacts, status :ok
  end
end
