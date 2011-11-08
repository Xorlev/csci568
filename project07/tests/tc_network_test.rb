$LOAD_PATH << '..'
require 'test/unit'
require 'network.rb'

class NetworkTests < Test::Unit::TestCase
  def test_network_creation
    n = Network.new
    assert n
  end
  
  def test_feed_forward_returns_values
    n = Network.new
    assert_equal 2, n.feed_forward([0.1, -0.5, 1]).size, 'ANN must have 3 outputs'
  end
  
  def test_training
    n = Network.new
    assert_equal 2, n.feed_forward([1.0, 0.25, -0.5]).size, 'ANN must be functioning'
    
    n.train [1.0, 0.25, -0.5], [1.0, -1.0, 0]
    
    assert_in_delta [1.0, -1.0, 0.0].reduce(:+), n.feed_forward([1.0, 0.25, -0.5]).reduce(:+), 2e-16, 'ANN must train properly'
  end
end