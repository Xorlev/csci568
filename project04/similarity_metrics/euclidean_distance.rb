module SimilarityMetrics
  def euclidean_distance(one, two)
    [one,two].transpose.map { |pair| (pair[0]-pair[1])**2 }.inject(0) { |acc,e| e+acc }**0.5
  end
end