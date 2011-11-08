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
    intermediate = []
    
    # Take inputs and feed them through each input node
    @input.nodes.zip(val).each do |node, val|
      # For each input node's links, calculate a weight for output to next layer
      intermediate << node.links.map { |l| l.weight*val }
    end

    #
    # Inputs to the hidden layer
    #
    
    # Collect the inputs to each hidden node and merge it with addition
    intermediate = intermediate.transpose
    intermediate = intermediate.map { |l| l.reduce(:+) }
    
    output = []
    @hidden.nodes.zip(intermediate).each do |node, val|
      # for each connection hidden->output, calculate the weighted output
      output << node.links.map { |l| l.weight*val }
    end
    
    # final weights
    output = output.map { |l| l.reduce(:+) }
  end
  
  def train
  end
end