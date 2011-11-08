$LOAD_PATH << '.'
require 'layer'
require 'edge'

class Network
  attr_accessor :input, :hidden, :output, :links, :training, :incoming_weight
  def initialize
    @input = Layer.new
    @hidden = Layer.new
    @output = Layer.new
    @training = []
    
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
        t.set_incoming_weight(s.links.last.weight)
      end
    end
    
    @hidden.nodes.each do |s|
      @output.nodes.each do |t|
        s.links << Edge.new(s,t)
        t.set_incoming_weight(s.links.last.weight)
      end
    end
  end
  
  def feed_forward(val, all = false)
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
    
    puts "X:" + output.inspect
    
    # final weights
    output = output.transpose.map { |l| l.reduce(:+) }
    
    if all
      return [val, intermediate, output]
    else
      return output
    end
  end
  
  def train(input, exp_output)
    # Add training data to corpus
    @training += [input, exp_output]
    
    sum_error = 1.0
    
    while sum_error != 0.0
      sum_error = 0.0
      
      new_data = @training.clone
      
      while new_data.size > 0
        puts new_data.size
        rand_sample = new_data.pop(Random.rand(new_data.size)+1)
        puts rand_sample.inspect
        input_data = rand_sample[0]
        output_data = rand_sample[1]
        
        puts input_data.size, output_data.size, '-----------'
        
        error = 0
        puts input_data.size
        current_output = self.feed_forward input_data, true
        #for each layer...
          #for each node...
          #for each connection
        [@hidden, @output].each_with_index do |layer, li|
          layer.nodes.each_with_index do |node, ni|
            node.links.each do |link|
              puts current_output.inspect
              puts node, node.incoming_weight, '_'
              new_weight = link.weight + 0.1*current_output[li+1][ni]*node.incoming_weight
              error += link.weight - new_weight
              link.weight = new_weight
            end
          end
        end
        
        sum_error += error
      end
    end
  end
end