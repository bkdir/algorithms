#
# Inefficiently counts the number of triples in a file of N integers that sum to 0.
# Order of growth is N^3.
#
require 'benchmark'

class ThreeSum
  def self.count filename = ""
    count = 0
    arr = 
      if filename.nil?
        (0...500).map { rand(-10000..10000) }
      else
        File.readlines(filename).map(&:to_i)
      end

    len = arr.length
    puts Benchmark.measure {
      for i in 0...len
        for j in (i+1)...len
          for k in (j+1)...len
            count += 1 if (arr[i] +arr[j] + arr[k]) == 0
          end
        end
      end
    }
    puts "#{count} triples of integers found."
  end
end

Benchmark.measure{ ThreeSum.count(ARGV[0]) }
