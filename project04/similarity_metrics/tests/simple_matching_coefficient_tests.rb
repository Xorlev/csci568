$LOAD_PATH << '../'
require 'test/unit'
require 'simple_matching_coefficient.rb'
include SimilarityMetrics

class TestSimpleMatchingCoefficient < Test::Unit::TestCase
  def test_same
    assert simple_matching_coefficient([true,true,true,true], [false,false,false,false]) == 0
  end
  
  def test_one_similar
    assert simple_matching_coefficient([true,true,true,true], [false,true,false,false]) == 0.25
  end
  
  def test_five
    assert simple_matching_coefficient([false,true,true,true,true], [false,true,false,true,false]) == 0.60
  end
end