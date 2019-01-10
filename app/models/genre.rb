class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.parameterize
  end

  def self.find_by_slug(slug)
    array_of_words = slug.split("-")
    array_of_words.map! do |word|
      word.capitalize
    end
    @name = array_of_words.join(" ")
    Genre.find_by(name: @name)
  end
end
