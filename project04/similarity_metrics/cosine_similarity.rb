module SimilarityMetrics
  def cosine_similarity(one, two)
    dot_product(one,two)/(magnitude(one)*magnitude(two)).to_f
  end
  
  module Utility
    def dot_product(a, b)
      [a,b].transpose.map { |x,y| x*y }.reduce(:+)
    end
  
    def magnitude(v)
      v.map { |x| x*x }.reduce(:+)**0.5
    end
  end
  include Utility
end