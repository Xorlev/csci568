$LOAD_PATH << '.'
require 'node'

class Layer
  attr_accessor :nodes
  def initialize
    @nodes = []
  end
  
  def add_node
    @nodes << Node.new
  end
end