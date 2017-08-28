#
# Determines the number of pairs of integers in an input file that sum to 0.
# Less complicated and improved version of ThreeSum. Uses mergesort and binary search.
# Order of growt is NlogN
#
require 'benchmark'
require_relative '../searching/binary_search'

class TwoSum
  include Algorithms

  def self.count filename = ""
    count = 0
    arr = 
      if filename.nil?
        (0...1000000).map { rand(-1000000..1000000) }
      else
        File.readlines(filename).map(&:to_i)
      end

    Benchmark.bm do |x|
      x.report("sorting:") { arr = arr.sort }
      x.report("searching:") {
        for i in 0...arr.length
          count += 1 if (BinarySearch.search(-arr[i], arr) > i)
        end
      }
    end
    puts "#{count} pairs of integers found."
  end
end

TwoSum.count(ARGV[0])
