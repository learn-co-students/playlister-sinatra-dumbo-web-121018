class Artist < ActiveRecord::Base
  has_many :songs
  # has_many :artist_genres
  has_many :genres, through: :songs

  def slug
    self.name.parameterize
  end

  def self.find_by_slug(slug)
    array_of_words = slug.split("-")
    @name = array_of_words.join(" ")
    hash_of_artists = Artist.lowercase_titles
    @artist_id = hash_of_artists[@name]
    Artist.find(@artist_id)
  end

  def self.lowercase_titles
    new_hash = {}
    Artist.all.each do |artist|
      lowercase_name = artist.slug.split("-").join(" ")
      new_hash[lowercase_name] = artist.id
    end
    new_hash
    #=> {"artist title"=>1, "artist two"=>2, }
  end
end
