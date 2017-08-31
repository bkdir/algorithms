#
# Shell Sort:
#   Based on Insertion Sort. Allows exchanges of array entries that are far apart to 
#   produce partially sorted(h-sorted) arrays that can be efficiently sorted 
#   by insertion eventually. Shell sort created sorted subsequences.
#
#   Understanding the performance of Shell Sort is not easy. Performance increase
#   is pretty good.
#
require_relative '../lib/stdin_reader'
require_relative 'sorting_template'

module Algorithms
  class ShellSort < SortingTemplate
    extend StdinReader
    def self.sort arr
      len = arr.length

      gaps(len).reverse.each do |h|
        # keep the distance(h) between 2 indexes fixed. and move till the end 
        # for ex. 0-13, 1-14, 2-15 etc.
        (h...len).each do |i|
          j = i
          while j >= h && less(arr[j], arr[j-h])
            exchange(arr, j, j-h)
            j -= h
          end
        end
      end
    arr
    end

    private
    # gaps(increment sequences) are calculated by the 
    # formula (3^k -1)/2 (Knuth Sequence)
    def self.gaps array_size
      h = 1
      arr = [1]
      while h < array_size / 3
        h = 3*h + 1 
        arr << h
      end
      arr
    end
  end
end

#include Algorithms
#
#arr = ShellSort.read_as_int
#ShellSort.sort(arr)
#
#puts ShellSort.sorted?(arr)
#ShellSort.show(arr)
