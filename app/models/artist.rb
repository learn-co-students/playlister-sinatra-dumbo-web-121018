# Artist Class
class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def self.find_by_slug(string)
    slug = string.split("-").map { |word| word.capitalize }.join(" ")
    self.find_by(name: slug)
    #
  end

end
