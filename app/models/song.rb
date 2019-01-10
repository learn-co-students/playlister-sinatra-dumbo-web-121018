class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.parameterize
  end

  def self.find_by_slug(slug)
    array_of_words = slug.split("-")
    @name = array_of_words.join(" ")
    # 'this-is-a-slug' => 'this is a slug'
    hash_of_songs = Song.lowercase_titles
    @song_id = hash_of_songs[@name]
    Song.find(@song_id)
  end

  # Creates hash of all song titles in lowercase as keys and ids as values
  def self.lowercase_titles
    new_hash = {}
    Song.all.each do |song|
      lowercase_name = song.slug.split("-").join(" ")
      new_hash[lowercase_name] = song.id
    end
    new_hash
    #=> {"song title"=>1, "song two"=>2, }
  end
end
