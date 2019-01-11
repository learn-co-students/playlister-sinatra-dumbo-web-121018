class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.parameterize
  end

  def self.find_by_slug(slug)
    array_of_words = slug.split("-")
    @name = array_of_words.join(" ")
    hash_of_genres = Genre.lowercase_titles
    @genre_id = hash_of_genres[@name]
    Genre.find(@genre_id)
  end

  def self.lowercase_titles
    new_hash = {}
    Genre.all.each do |genre|
      lowercase_name = genre.slug.split("-").join(" ")
      new_hash[lowercase_name] = genre.id
    end
    new_hash
    #=> {"genre title"=>1, "genre two"=>2, }
  end

end
