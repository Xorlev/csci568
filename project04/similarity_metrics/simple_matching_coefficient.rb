require 'test/unit'

module SimilarityMetrics
  def simple_matching_coefficient(one, two)
    tp = [one,two].transpose
    
    p = map_transpose(tp) { |pair| pair[0] == true && pair[0] == pair[1] }
    q = map_transpose(tp) { |pair| pair[0] == true && pair[1] == false }
    r = map_transpose(tp) { |pair| pair[0] == false && pair[1] == true }
    s = map_transpose(tp) { |pair| pair[0] == false && pair[0] == pair[1] }
    
    t = p + q + r + s
    
    (p+s)/t.to_f
  end
  
  def map_transpose(transpose, &block)
    transpose.map { |pair| block.call(pair) }.find_all{|x| x == true}.count
  end
    
end


class TestEuclideanDistance < Test::Unit::TestCase
  include SimilarityMetrics
  def test_same
    assert simple_matching_coefficient([true,true,true,true], [false,false,false,false]) == 0
  end
  
  def test_one_similar
    assert simple_matching_coefficient([true,true,true,true], [false,true,false,false]) == 0.25
  end
end