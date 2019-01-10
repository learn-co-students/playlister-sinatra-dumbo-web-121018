class ArtistsController < ApplicationController
  #Index
  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  #Show
  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    @songs = @artist.songs
    @genres = @artist.genres
    # binding.pry
    erb :'artists/show'
  end
end
