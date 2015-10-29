require 'rails_helper'

describe Song do

  context "each song" do

    it "has a url attribute" do

      song = Song.create
      song.url = 'www.example.com'
      expect(song.url).to eq('www.example.com')
  
    end
  
  end

end