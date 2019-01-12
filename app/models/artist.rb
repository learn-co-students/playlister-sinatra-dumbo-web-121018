# Artist Class
class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def initialize(args={})
    super(args)
    self.slug = args[:name].slugify if args.key?(:name)
    save
  end

  def self.find_by_slug(slug)
    find_by(slug: slug)
  end
end
