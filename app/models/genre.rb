class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def initialize(args={})
    super(args)
    self.slug = args[:name].slugify if args.key?(:name)
    save
  end

  def self.find_by_slug(slug)
    find_by(slug: slug)
  end
end
