require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash
  # Index Action
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  # New Action
  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  # Create Action
  post '/songs' do
    song = Song.create(name: params["Name"])
    artist = Artist.find_or_create_by(name: params[:artist_name])
    song.artist = artist
    params[:genre_slugs].each do |genre_slug|
      genre = Genre.find_by_slug(genre_slug)
      song.song_genres.build(genre: genre)
    end
    song.save
    flash.now[:notice] = 'Successfully updated song.'
    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artists = Artist.all
    @genres = Genre.all
    erb :"/songs/edit"
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    artist = Artist.find_or_create_by(name: params[:artist_name])
    song.artist = artist
    song.genres = []
    params[:genre_slugs].each do |genre_slug|
      genre = Genre.find_by_slug(genre_slug)
      song.song_genres.build(genre: genre)
    end
    song.save
    artist.save
    flash.now[:notice] = 'Successfully updated song.'
    redirect "/songs/#{song.slug}"
  end
end
