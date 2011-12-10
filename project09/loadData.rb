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

File.open('track1/genreData1.txt').map do |line|
	Genre.create! :id => line.to_i
end

puts Genre.all