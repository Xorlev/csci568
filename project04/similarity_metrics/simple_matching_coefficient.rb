module SimilarityMetrics
  def simple_matching_coefficient(one, two)
    tp = [one,two].transpose
    
    p = map_transpose(tp) { |x,y| x == true && x == y }
    q = map_transpose(tp) { |x,y| x == true && y == false }
    r = map_transpose(tp) { |x,y| x == false && y == true }
    s = map_transpose(tp) { |x,y| x == false && x == y }
    
    t = p + q + r + s
    
    (p+s)/t.to_f
  end
  
  module Utility
    def map_transpose(transpose, &block)
      transpose.map { |pair| block.call(pair) }.find_all{|x| x == true}.count
    end
  end
  include Utility
end