$LOAD_PATH << '../'
require 'test/unit'
require 'simple_matching_coefficient.rb'
include SimilarityMetrics

class TestSimpleMatchingCoefficient < Test::Unit::TestCase
  def test_same
    assert_in_delta 0, simple_matching_coefficient([true,true,true,true], [false,false,false,false]), 2e-20
  end
  
  def test_one_similar
    assert_in_delta 0.25, simple_matching_coefficient([true,true,true,true], [false,true,false,false]), 2e-20
  end
  
  def test_five
    assert_in_delta 0.60, simple_matching_coefficient([false,true,true,true,true], [false,true,false,true,false]), 2e-20
  end
end