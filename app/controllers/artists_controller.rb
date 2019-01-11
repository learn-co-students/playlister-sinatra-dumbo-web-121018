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
    artist = Artist.create(name: params[name], slug: params[name].slugify)
    redirect "/artists/#{artist.slug}"
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :"/artists/show"
  end
end
