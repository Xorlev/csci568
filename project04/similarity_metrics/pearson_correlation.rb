module SimilarityMetrics
  def pearson_correlation(one, two)
    xmean, xstddev = mean_and_standard_deviation(one)
    ymean, ystddev = mean_and_standard_deviation(two)

    [one,two].transpose.map do |pair| 
      zx = zscore(pair[0], xmean, xstddev)
      zy = zscore(pair[1], ymean, ystddev)
      zx*zy
    end.reduce(:+)/one.size
  end
  
  def zscore(x, mean, stddev)
    (x-mean)/stddev.to_f
  end
  
  def mean(array)
    array.inject(0) { |sum, x| sum += x } / array.size.to_f
  end
  
  def mean_and_standard_deviation(array)
    m = mean(array)
    variance = array.inject(0) { |variance, x| variance += (x - m) ** 2 }
    return m, Math.sqrt(variance/(array.size-1))
  end
end