$LOAD_PATH << '../'
require 'test/unit'
require 'euclidean_distance.rb'

class TestEuclideanDistance < Test::Unit::TestCase
  include SimilarityMetrics
  def test_same
    assert_in_delta 0, euclidean_distance([1,2,3,4], [1,2,3,4]), 2e-20
  end
  
  def test_opposite_four
    assert_in_delta 4.47213595499958, euclidean_distance([4,3,2,1], [1,2,3,4]), 2e-20
  end
end