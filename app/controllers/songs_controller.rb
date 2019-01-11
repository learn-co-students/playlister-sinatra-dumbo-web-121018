class SongsController < ApplicationController
  # Index
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  # New
  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    # binding.pry
    erb :'songs/new'
  end

  # Create
  post '/songs' do
    # binding.pry
    @song = Song.create(params["song"])
    @song.update(artist_id: params["artist"]["id"])

    #Need to add genres
    params["genre"].each do |genre_id, genre_name|
      SongGenre.create(song_id: @song.id, genre_id: genre_id)
    end

    # binding.pry
  end

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
