class SongsController < ApplicationController
  # Index
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  # New

  # Create

  # Show
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find(@song.artist_id)
    @genre = Genre.find(@song.genres.ids[0])
    erb :'songs/show'
  end
  # Edit

  #Update

  #Destroy
end
