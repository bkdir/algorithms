module Algorithms
  class BagIterator
    def initialize collection
      @collection = collection
      @current = collection.first
    end

    def first
      @collection.first
    end

    def next
      current_node = @current
      @current = @current.next_node
      current_node
    end

    def has_next?
      @current != nil
    end

    def current_item
      raise IteratorOutOfBound if @current == nil
      @current
    end
  end

  IteratorOutOfBound = Class.new(StandardError)
end
