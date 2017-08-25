module Algorithms
  class Node
    attr_accessor :data, :next_node

    def initialize data, next_node = nil
      @data = data
      @next_node = next_node
    end
  end

  class LinkedListQueue
    class << self
      attr_accessor :number_of_items
    end
    @number_of_items = 0

    def initialize data
      @head = Node.new data
      @tail = @head
      self.class.number_of_items += 1
    end

    def enqueue item
      tail = @tail
      @tail = Node.new item
      empty? ? @head = @tail : tail.next_node = @tail
      self.class.number_of_items += 1
    end
    
    def dequeue
      raise "Queue is empty" if empty?

      removed_item, @head = @head, @head.next_node
      self.class.number_of_items -= 1
      @tail = nil if empty?

      removed_item
    end

    def empty?
      @head == nil
    end

    def size
      self.class.number_of_items
    end

    alias_method :<<, :enqueue
    alias_method :push, :enqueue
    alias_method :shift, :dequeue
  end
end
