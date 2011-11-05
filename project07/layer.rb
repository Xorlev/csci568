class Layer
  attr_accessor :nodes
  def initialize
    @nodes = []
    @nodes << Node.new
  end
end