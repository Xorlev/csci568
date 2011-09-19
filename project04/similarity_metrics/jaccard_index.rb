module SimilarityMetrics
  def jaccard_index(one, two)
    tp = [one,two].transpose
    
    m11 = map_transpose(tp) { |x,y| x == true && x == y }
    m10 = map_transpose(tp) { |x,y| x == true && y == false }
    m01 = map_transpose(tp) { |x,y| x == false && y == true }
    m00 = map_transpose(tp) { |x,y| x == false && x == y }

    (m11)/(m01+m10+m11).to_f
  end
  
  def map_transpose(transpose, &block)
    transpose.map { |pair| block.call(pair) }.find_all{|x| x == true}.count
  end
end