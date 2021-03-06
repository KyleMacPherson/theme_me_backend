class SongsController < ApplicationController

  def index
    songs = Song.all
    render json: songs
  end
  def show
    song = Song.find(params[:id])
    render json: song
  end

  def create
    hash = JSON.parse(request.body.read)
    song = Song.new(url:(hash["url"]), person:(hash["person"]), comment:(hash['comment']))
    if song.save
      render json: song.id
      #by default send back object
    else
      render json: song.errors
    end
  end

  def destroy
    song = Song.find(params[:id])
    song.destroy
  end

  def update
    song = Song.find(params[:id])
    hash = JSON.parse(request.body.read)
    song.update(url:(hash["url"]))
    #needs work, need to be more flexible
  end

  def random
    songs = Song.all
    random_song = songs.to_a.shuffle.pop
    render json: random_song
  end

  private

    def user_params
      params.require(:song).permit(:url, :person, :name)
    end

end
