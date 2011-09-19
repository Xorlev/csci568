$LOAD_PATH << '../'
require 'test/unit'
require 'pearson_correlation.rb'

class TestPearsonCorrelation < Test::Unit::TestCase
  include SimilarityMetrics
  def test_negative_correlation
    assert_equal -0.164399, pearson_correlation([5,6,7,8,3], [3,4,5,6,7])
  end
  
  def test_exact_correlation
    assert_equal 1, pearson_correlation([5,6,7,8,3], [5,6,7,8,3])
  end
  
  def test_high_positive_correlation
    assert_equal 0.98639392, pearson_correlation([5,6,7,8,9], [3,4,5,6,8])
  end

  def test_no_correlation
    assert_equal 0, pearson_correlation([1,3,5,7,9], [2,5,0,9,0])
  end
end