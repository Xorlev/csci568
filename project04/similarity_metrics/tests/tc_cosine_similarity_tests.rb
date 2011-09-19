$LOAD_PATH << '../'
require 'test/unit'
require 'cosine_similarity.rb'

class TestCosineSimilarity < Test::Unit::TestCase
  include SimilarityMetrics
  def test_apple_applet
    # apple union applet -> {a,e,l,p,t}
    # freq vectors: apple = (1,1,1,2,0), applet = (1,1,1,2,1)
    assert_in_delta 0.935414347, cosine_similarity([1,1,1,2,0], [1,1,1,2,1]), 2 ** -20
  end
  
  def test_julie_jane
    # http://stackoverflow.com/questions/1746501/
    # 8-dimensional frequency vectors
    assert_in_delta 0.822, cosine_similarity([2,1,0,2,0,1,1,1], [2,1,1,1,1,0,1,1]), 2 ** -11
  end
end