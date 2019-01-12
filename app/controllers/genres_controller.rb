class GenresController < ApplicationController
  # Index Action
  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  # New Action
  get '/genres/new' do
    erb :'/genres/new'
  end

  # Create Action
  post '/genres' do
    genre = Genre.create(name: params[name], slug: params[name].slugify)
    redirect "/genres/#{genre.slug}"
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :"/genres/show"
  end
end
