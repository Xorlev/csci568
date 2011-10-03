require 'sqlite3'

def kmeans(data, k, max_iterations=1000)
  # Pick k random datapoints as a start point
  centroids = random_centroids(data, k)
  clusters = {}
  
  # Default max 1000 iterations
  max_iterations.times do
    # If we don't find the closest centroids, we won't move our centroids closer to the real clusters
    # This returns a centroid -> [points] hash
    clusters = find_closest_centroids(centroids, data)

    # Get our new clusters by taking the mean of the current cluster 
    new_centroids = [].tap do |list|
      clusters.each { |c,points| list << mean(points) }
    end
    
    # If the euclidean distance of the new centroids to the old is less than some value, end
    if [centroids, new_centroids].transpose.map { |one,two| euclidean_distance(one,two) }.reduce(:+).to_f/centroids.size < 1e-5
      break
    end
      
  end
  
  clusters
end

def random_centroids(data, n)
  # n times pick a random datapoint
  n.times.map { data.sample }
end

# return centroid -> [points]
def find_closest_centroids(centroids, array)
  dict = Hash.new {|h,k| h[k] = []}

  array.each do |point|
    min_dist = nil
    min_c = []
  
    centroids.each do |c|
      dist = euclidean_distance(c, point)
      if min_dist.nil? or dist < min_dist
        min_dist = dist
        min_c = c
      end
    end
    dict[min_c] << point
  end
  
  dict
end

def sse(dict)
  vsse = []
  dict.each do |c, points|
    error = 0
    points.each do |point|
      error += euclidean_distance(c, point)**2
    end
    vsse << error.round(3)
  end
  vsse
end

def mean(array)
  array.transpose.map { |d| d.reduce(:+).to_f/d.size }
end

def euclidean_distance(one, two)
  # ignore the first field, assume it's instance#
  [one,two].transpose.map { |x,y| (x-y)**2 }.reduce(:+)**0.5
end

# Open the Iris dataset
db = SQLite3::Database.open('iris.sqlite3.db')
data = db.execute('SELECT * FROM iris')
data = data.map { |d| d[1..-2] }

# Get the clusters with k = 3
clust = kmeans(data, 3)

puts '===Cluster Sizes==='
clust.each do |c,pts|
  puts pts.size.to_s
end

puts 'Total: ' + clust.map { |k,v| v.size }.reduce(:+).to_s

puts 'SSE: ' + sse(clust).join(', ') + ' (' + sse(clust).reduce(:+).to_s + ')'