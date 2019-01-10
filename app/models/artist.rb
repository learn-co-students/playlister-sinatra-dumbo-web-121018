class Artist < ActiveRecord::Base
  has_many :songs
  # has_many :artist_genres
  has_many :genres, through: :songs

  def slug
    self.name.parameterize
  end

  def self.find_by_slug(slug)
    array_of_words = slug.split("-")
    array_of_words.map! do |word|
      word.capitalize
    end
    @name = array_of_words.join(" ")
    Artist.find_by(name: @name)
  end
end
