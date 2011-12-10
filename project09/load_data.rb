## Use ActiveRecord
$LOAD_PATH << '.'

require 'active_record'
require 'logger'
require 'models.rb'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'kdd.db'
)

ActiveRecord::Base.logger = Logger.new(STDERR)

Genre.delete_all
Artist.delete_all
Album.delete_all
Track.delete_all

def split_and_filter(line)
  line.split('|').map { |f| none_or_int(f) }
end

def none_or_int(p)
  (p != "None" && p.to_i) || nil
end

File.open('track1/genreData1.txt').each do |line|
  Genre.create! :id => line.to_i
end

File.open('track1/artistData1.txt').each do |line|
  Artist.create! :id => line.to_i
end

File.open('track1/albumData1.txt').each do |line|
  album, artist, *genres = split_and_filter(line)

  Album.create! :id => album, :artist_id => artist
end

File.open('track1/trackData1.txt').each do |line|
  track, album, artist, *genres = split_and_filter(line)
  
  Track.create! :id => track, :album_id => album, :artist_id => artist
end


puts Genre.all
puts Artist.all
puts Album.all
puts Track.all