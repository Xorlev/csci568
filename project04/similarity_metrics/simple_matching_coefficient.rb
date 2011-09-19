require 'test/unit'

module SimilarityMetrics
  def simple_matching_coefficient(one, two)
    x = [one,two].transpose.map { |pair| pair[0] == pair[1] }
    p = x.find_all{|x| x == true}.count
    s = x.find_all{|x| x == true}
  end
end


class TestEuclideanDistance < Test::Unit::TestCase
  include SimilarityMetrics
  def test_same
    assert simple_matching_coefficient([1,1,1,1], [0,0,0,0]) == 0
  end
  
  def test_one_similar
    assert simple_matching_coefficient([1,1,1,1], [0,1,0,0]) == 0.25
  end
end