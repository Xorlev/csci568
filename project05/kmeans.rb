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
  # Generate a new hash whose default element is an empty list
  dict = Hash.new {|h,k| h[k] = []}

  # For each data point
  array.each do |point|
    # Start the minimum distance at nil
    min_dist = nil
    min_c = []
  
    # For every centroid
    centroids.each do |c|
      # Calculate the distance between point and centroid
      dist = euclidean_distance(c, point)
      
      # If the dist is < the current, the point switches centroids
      if min_dist.nil? or dist < min_dist
        min_dist = dist
        min_c = c
      end
    end
    
    # Add the point to the given centroid's list
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
  # Transpose the array elements, add them, divide by # of elements
  # Returns an array of means for each dimension
  array.transpose.map { |d| d.reduce(:+).to_f/d.size }
end

def euclidean_distance(one, two)
  # Transpose the array elements
  # [[d1,d2], [d1,d2]] => [[d1, d1], [d2,d2]]
  # Subtract and square each pair, sum, then take the sqrt (^0.5)
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