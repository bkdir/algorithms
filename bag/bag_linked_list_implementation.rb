# to Iterate Bag:
#
#  bag_object.each_node { |n| puts n.data }
#
# or
#
#  bag_iterator = bag_object.create_iterator
#  while bag_iterator.has_next?
#    puts bag_iterator.next.data
#  end
#
require_relative '../lib/bag_iterator'

module Algorithms
  class Node
    attr_accessor :data, :next_node

    def initialize data, next_node
      @data = data
      @next_node = next_node
    end
  end

  class LinkedListBag
    class << self
      attr_accessor :number_of_items
    end
    @number_of_items = 0

    attr_reader :first

    def initialize data = nil
      @first = Node.new data, nil
      self.class.number_of_items += 1
    end

    def push data
      @first = Node.new data, @first
      self.class.number_of_items += 1
    end

    def empty?
      @first == nil
    end

    def size
      self.class.number_of_items
    end

    # internal iterator
    def each_node
      loop do
        break if @first.nil?
        yield(@first) if block_given?
        @first = @first.next_node
      end
    end

    # external Iterator
    def create_iterator
      BagIterator.new(self)
    end
  end
end
