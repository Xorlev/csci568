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