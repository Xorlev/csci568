$LOAD_PATH << '.'
require 'layer'
require 'edge'

class Network
  attr_accessor :input, :hidden, :output, :links
  def initialize
    @input = Layer.new
    @hidden = Layer.new
    @output = Layer.new
    
    3.times do
      @input.add_node
      @output.add_node
    end
    
    2.times do
      @hidden.add_node
    end
    
    @input.nodes.each do |s|
      @hidden.nodes.each do |t|
        s.links << Edge.new(s,t)
      end
    end
    
    @hidden.nodes.each do |s|
      @output.nodes.each do |t|
        s.links << Edge.new(s,t)
      end
    end
  end
  
  def feedforward(val)
  end
  
  def train
  end
end

Network.new