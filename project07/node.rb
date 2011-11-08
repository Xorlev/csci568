class Node
  attr_accessor :links, :incoming_weight
  def initialize
    @links = []
  end
  
  def set_incoming_weight(w)
    @incoming_weight = w
  end
  
  def add_link(edge)
    @links << node
  end
  
  def activate? val
    Math.tanh val > 0.4
  end
end