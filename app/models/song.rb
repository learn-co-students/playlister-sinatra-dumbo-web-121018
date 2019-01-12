class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def initialize(args={})
    super(args)
    self.slug = args[:name].slugify if args.key?(:name)
    save
  end

  def self.find_by_slug(slug)
    find_by(slug: slug)
  end
end
