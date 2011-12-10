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

puts Track.all