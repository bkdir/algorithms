#
# Selection sort: 
#   Find the smallest item in the array and swap it with the first entry.
#   Then, find the next smallest item and swap it with the second entry. 
#   Continue in this way until the entire array is sorted.
#
#   Order of growth: N^2.
#   Number of Exchanges: N
#   Number of Comparisons: (N-1) + (N-2)... + 2 + 1 + 0 = ~N^2/2 
#
#   - Uses custom standard in reader to read int/string from stdin
#   - SortingTemplate contains common methods used by sorting algorithms
#
require_relative '../lib/stdin_reader'
require_relative 'sorting_template'

module Algorithms
  class SelectionSort < SortingTemplate
    extend StdinReader
    def self.sort arr
      len = arr.length
      (0...len).each do |i|
        index_of_min = i
        ((i+1)...len).each do |j|
          index_of_min = j if less(arr[j], arr[index_of_min])
        end
        exchange(arr, i, index_of_min) 
      end
    end
  end
end

#include Algorithms
#
#arr = SelectionSort.read_as_int
#SelectionSort.sort(arr)
#
#puts SelectionSort.sorted?(arr)
#SelectionSort.show(arr)
