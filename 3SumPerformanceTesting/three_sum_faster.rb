#
# Algorithmically improved version of ThreeSum. 
# Uses mergesort and binary search.
# Order of growt is N^2 logN
#
require 'benchmark'
require_relative '../searching/binary_search'

class ThreeSumFaster
  include Algorithms

  def self.count filename = ""
    count = 0
    arr = 
      if filename.nil?
        (0...5000).map { rand(-10000..10000) }
      else
        File.readlines(filename).map(&:to_i)
      end

    Benchmark.bm do |x|
      x.report("sorting:") { arr = arr.sort }
      x.report("searching:") {
        for i in 0...arr.length
          for j in (i+1)...arr.length
            count += 1 if (BinarySearch.search(-arr[i]-arr[j], arr) > j)
          end
        end
      }
    end
    puts "#{count} triples of integers found."
  end
end

ThreeSumFaster.count(ARGV[0])
