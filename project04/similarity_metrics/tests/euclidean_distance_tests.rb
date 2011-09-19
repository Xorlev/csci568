$LOAD_PATH << '../'
require 'test/unit'
require 'euclidean_distance.rb'

class TestEuclideanDistance < Test::Unit::TestCase
  include SimilarityMetrics
  def test_same
    assert euclidean_distance([1,2,3,4], [1,2,3,4]) == 0
  end
  
  def test_opposite_four
    assert euclidean_distance([4,3,2,1], [1,2,3,4]) - 4.47213595499958 < 10e-6
  end
end