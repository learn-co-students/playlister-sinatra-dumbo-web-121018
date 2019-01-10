class ArtistsController < ApplicationController

# Index Action
    get '/artists' do
      @artists = Artist.all
      erb :'/artists/index'
    end

# New Action
    get '/artists/new' do
      erb :'/artists/new'
    end

# Create Action
    post '/artists' do
      artist = Artist.create(params)
      redirect "/artists/#{artist.id}"
    end

    get '/artists/:id' do
      @artist = Artist.find(params[:id])
      erb :"/artists/show"
    end

end
