#
#include Algorithms
#
#if ARGV[0] && ARGV[1]
#  BinarySearch.search_from_file ARGV[0], ARGV[1]
#else
#  BinarySearch.test
#end
#
module Algorithms
  class BinarySearch
    class << self
      def search num, arr
        low = 0
        hi = (arr.size) -1

        while low <= hi
          mid = low + (hi - low) / 2
          if num < arr[mid]
            hi = mid -1 
          elsif num > arr[mid]
            low = mid + 1 
          else
            return mid
          end
        end
        return -1
      end

      # outputs whether the numbers in "test_case" exist in whitelist
      def search_from_file whitelist, test_case
        tests = file_to_array test_case
        whitelist = file_to_array whitelist
        whitelist.sort!

        tests.each { |num| check_number(num, whitelist) }
      end

      def test
        tests = [6, 12, 0, 8]
        whitelist = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

        tests.each { |num| check_number(num, whitelist) }
      end

      private

      def file_to_array filename
        File.readlines(filename).map(&:strip)
      end

      def check_number num, whitelist
        puts "#{num} #{search(num, whitelist) > 0 ? 'in the list' : 'couldn\'t found'}"
      end
    end
  end
end
