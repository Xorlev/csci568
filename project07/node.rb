class Node
  attr_accessor :weight
  def initialize
    @weight = -1 + rand(100)/50.0
  end
  
  def activate?
  end
end