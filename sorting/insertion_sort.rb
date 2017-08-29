#
# Insertion sort: 
#   Uses the same algorithm that people use to sort bridge hands: 
#     Consider the cards one at a time, inserting each into its proper place among 
#     those already considered. Average is N^2/4, worst cae is N^2/2.
#     Works well for certain types of nonrandom array:
#       - An array where each entry is not far from its final position,
#       - A small array appended to a large sorted array,
#       - An array with only a few entries that are not in place.
#
#   - Uses custom stdin reader to read int/string from stdin.
#   - SortingTemplate contains common methods used by sorting algorithms
#
require_relative '../lib/stdin_reader'
require_relative 'sorting_template'

module Algorithms
  class InsertionSort < SortingTemplate
    extend StdinReader
    def self.sort arr
      len = arr.length
      (1...len).each do |i|
        j = i
        while (j > 0) && less(arr[j], arr[j-1]) do
          exchange(arr, j, j-1)
          j -= 1
        end
      end
    end
  end
end

#include Algorithms
#
#arr = InsertionSort.read_as_int
#InsertionSort.sort(arr)
#
#puts InsertionSort.sorted?(arr)
#InsertionSort.show(arr)
