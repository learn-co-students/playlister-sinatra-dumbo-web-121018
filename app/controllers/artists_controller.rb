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
      @artist = Artist.create(params)
      redirect "/artists/#{}"
    end

end
