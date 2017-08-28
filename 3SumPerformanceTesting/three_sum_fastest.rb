#
# Algorithmically improved version of ThreeSumFaster. 
# Order of growt is N^2
#
#  
require 'benchmark'

class ThreeSumFastest
  def initialize filename
    @arr = get_arr filename
  end

  def get_arr filename
    filename.nil? ? 
      (0...5000).map { rand(-10000..10000) } : 
      File.readlines(filename).map(&:to_i)
  end

  def calculate
    count = 0
    len = @arr.length

    Benchmark.bm do |x|
      x.report("sort:") { @arr.sort! }
      x.report("count:") {
        for i in 0...len
          next if @arr[i] > 0
          next if(i > 0 && (@arr[i] == @arr[i-1]))  # Skip duplicates

          to_zero = @arr[i] * -1
          @head = i + 1
          @tail = len -1
          while @head < @tail
            total = @arr[@head] + @arr[@tail]
            if total == to_zero
              count += 1
              increment_head
              decrement_tail
            elsif total > to_zero
              decrement_tail
            else
              increment_head
            end
          end
        end
      }
    end
    puts "#{count} triples of integer found."
  end

  private

  def increment_head
    loop do
      @head += 1
      break if @arr[@head] != @arr[@head-1]
    end
  end

  def decrement_tail
    loop do
      @tail -=1
      break if @arr[@tail] != @arr[@tail+1]
    end
  end
end

Benchmark.measure {
  three_sum_calculator = ThreeSumFastest.new(ARGV[0])
  three_sum_calculator.calculate 
}
