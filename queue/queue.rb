module Algorithms
  class Queue
    def initialize arr = []
      @arr = arr
    end

    def empty?
      @arr.empty?
    end

    def enqueue item
      @arr.push item
    end
    
    def dequeue
      @arr.shift
    end

    def size
      @arr.size
    end

    alias_method :<<, :enqueue
    alias_method :push, :enqueue
    alias_method :shift, :dequeue
  end
end
