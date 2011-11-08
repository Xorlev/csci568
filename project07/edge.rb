class Edge
  attr_accessor :weight, :source, :target
  
  def initialize(source, target)
    @source = source
    @target = target
    @weight = -1 + rand(100)/50.0
  end
end