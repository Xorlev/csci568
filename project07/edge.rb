class Edge
  attr_accessor :weight, :source, :target
  @weight = -1 + rand(100)/50.0
  
  def initialize(source, target)
    @source = source
    @target = target
  end
end