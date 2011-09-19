module SimilarityMetrics
  def pearson_correlation(one, two)
    xmean, xstddev = mean_and_standard_deviation(one)
    ymean, ystddev = mean_and_standard_deviation(two)

    sum_xy = [one,two].transpose.map { |x,y| x*y }.reduce(:+)
    
    (sum_xy-one.size*xmean*ymean)/((one.size-1)*xstddev*ystddev)
  end
  
  def mean(array)
    array.reduce(:+) / array.size.to_f
  end
  
  def mean_and_standard_deviation(array)
    m = mean(array)
    variance = array.inject(0) { |variance, x| variance += (x - m) ** 2 }
    return m, Math.sqrt(variance/(array.size-1))
  end
end