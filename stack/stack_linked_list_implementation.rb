module Algorithms
  class Node
    attr_accessor :data, :next_node

    def initialize data, next_node
      @data = data
      @next_node = next_node
    end
  end

  class LinkedListStack
    class << self
      attr_accessor :number_of_items
    end
    @number_of_items = 0

    def initialize data = nil
      @head = Node.new data, nil
      self.class.number_of_items += 1
    end

    def push data
      @head = Node.new data, @head
      self.class.number_of_items += 1
    end

    def pop
      pop_item = @head.data
      @head = @head.next_node
      self.class.number_of_items -= 1
      pop_item
    end

    def empty?
      @head == nil
    end

    def size
      self.class.number_of_items
    end
  end
end
