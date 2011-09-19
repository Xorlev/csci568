module SimilarityMetrics
  def euclidean_distance(one, two)
    [one,two].transpose.map { |x,y| (x-y)**2 }.reduce(:+)**0.5
  end
end