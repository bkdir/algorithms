#
# implements common methods for sorting algorithms
#
module Algorithms
  class SortingTemplate
    class << self
      def sort
        raise NotImplemented
      end

      def sorted? arr
        (1...arr.length).each { |i| return false if less(arr[i], arr[i-1]) }
        true
      end

      def show arr
        p arr
      end

      private

      def less item1, item2
        (item1 <=> item2) < 0
      end

      def exchange arr, i, j
       arr[i], arr[j] = arr[j], arr[i] 
      end

      NotImplemented = Class.new(StandardError)
    end
  end
end
