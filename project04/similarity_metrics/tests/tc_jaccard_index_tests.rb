$LOAD_PATH << '../'
require 'test/unit'
require 'jaccard_index.rb'

class TestJaccardIndex < Test::Unit::TestCase
  include SimilarityMetrics
  def test_same
    assert_in_delta 0, jaccard_index([true,true,true,true], [false,false,false,false]), 2e-20
  end
  
  def test_one_similar
    assert_in_delta 0.25, jaccard_index([true,true,true,true], [false,true,false,false]), 2e-20
  end
  
  def test_five
    assert_in_delta 0.50, jaccard_index([false,true,true,true,true], [false,true,false,true,false]), 2e-20
  end
end