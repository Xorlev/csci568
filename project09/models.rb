require 'active_record'

class Album < ActiveRecord::Base
	belongs_to :artist
	has_many :tracks

	attr_accessible :id, :artist_id

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
	attr_accessible :id

	def to_s
		"Genre(#{id}) #{name}"
	end
end

class Track < ActiveRecord::Base
	belongs_to :artist
	belongs_to :album

	attr_accessible :id, :artist_id, :album_id

	def to_s
		"Track(#{id}) #{name}, Album(#{album_id}), Artist(#{artist_id})"
	end
end