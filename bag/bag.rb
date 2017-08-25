#
# Calculates mean and standard deviation.
# Order is not important. Only supports #add
# 
# include Algorithms
# bag = Bag.new([99, 109, 22, 409, 11, 11, 0]) 
# puts bag.average
# puts bag.standard_deviation
#
module Algorithms
  class Bag
    def initialize arr = []
      @bag = arr 
    end
    
    def empty?
     @bag.empty? 
    end

    def add item
      @bag << item
    end

    def size
      @bag.size
    end

    def average
      @bag.inject(&:+) / size
    end

    def standard_deviation
      mean = average
      sum = @bag.inject(0.0) do |sum, el|
        sum + (el - mean) * (el - mean)
      end

      Math.sqrt(sum / ((@bag.size) -1))
    end
  end
end
