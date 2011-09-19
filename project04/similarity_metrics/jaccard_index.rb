module SimilarityMetrics
  def jaccard_index(one, two)
    tp = [one,two].transpose
    
    m11 = map_transpose(tp) { |pair| pair[0] == true && pair[0] == pair[1] }
    m10 = map_transpose(tp) { |pair| pair[0] == true && pair[1] == false }
    m01 = map_transpose(tp) { |pair| pair[0] == false && pair[1] == true }
    m00 = map_transpose(tp) { |pair| pair[0] == false && pair[0] == pair[1] }

    (m11)/(m01+m10+m11).to_f
  end
  
  def map_transpose(transpose, &block)
    transpose.map { |pair| block.call(pair) }.find_all{|x| x == true}.count
  end
end