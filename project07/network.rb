class Network
  attr_accessor :input, :hidden, :output
  def initialize
    @input = Layer.new
    @hidden = Layer.new
    @output = Layer.new
  end
  
  def feedforward(val)
  end
end