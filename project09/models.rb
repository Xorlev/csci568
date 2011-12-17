require 'active_record'

class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :tracks
  has_and_belongs_to_many :genres

  attr_accessible :id, :artist_id, :genres

  def to_s
    "Album(#{id}), Artist(#{artist_id})"
  end
end

class Artist < ActiveRecord::Base
  has_many :albums
  has_many :tracks

  attr_accessible :id

  def to_s
    "Artist(#{id})"
  end
end

class Genre < ActiveRecord::Base
  has_and_belongs_to_many :albums
  has_and_belongs_to_many :tracks

  attr_accessible :id

  def to_s
    "Genre(#{id}) #{name}"
  end
end

class Track < ActiveRecord::Base
  belongs_to :artist
  belongs_to :album
  has_and_belongs_to_many :genres

  attr_accessible :id, :artist_id, :album_id, :genres

  def to_s
    "Track(#{id}) #{name}, Album(#{album_id}), Artist(#{artist_id})"
  end
end

class User < ActiveRecord::Base
  has_many :ratings

  attr_accessible :id

  def to_s
    "User(${id})"
  end
end

class Rating < ActiveRecord::Base
  belongs_to :user

  attr_accessible :id, :user_id, :rating
end