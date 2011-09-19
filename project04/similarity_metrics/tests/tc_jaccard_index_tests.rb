$LOAD_PATH << '../'
require 'test/unit'
require 'jaccard_index.rb'

class TestJaccardIndex < Test::Unit::TestCase
  include SimilarityMetrics
  def test_same
    assert jaccard_index([true,true,true,true], [false,false,false,false]) == 0
  end
  
  def test_one_similar
    assert jaccard_index([true,true,true,true], [false,true,false,false]) == 0.25
  end
  
  def test_five
    assert jaccard_index([false,true,true,true,true], [false,true,false,true,false]) == 0.5
  end
end