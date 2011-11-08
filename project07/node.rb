class Node
  attr_accessor :links
  def initialize
    @links = []
  end
  
  def add_link(edge)
    @links << node
  end
  
  def activate? val
    Math.tanh val > 0.4
  end
end