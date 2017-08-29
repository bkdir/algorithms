require_relative 'selection_sort'
require_relative 'insertion_sort'
require 'Benchmark'

include Algorithms

#
# both sort algorithms will sort the same arrays:
# 100 arrays with 1k elements each
#
insertion_test = []
100.times do |i|
  insertion_test[i] = (0...1000).map{ rand(0...1000) } 
end
selection_test = insertion_test.dup

Benchmark.bm do |x|
  x.report ("Insertion:"){ 
    100.times{ |i| InsertionSort.sort(insertion_test[i]) }
  }
  x.report("Selection:"){ 
    100.times{ |i| SelectionSort.sort(selection_test[i])} 
  }
end
