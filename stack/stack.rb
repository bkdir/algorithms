module Algorithms
  class Stack
    def initialize
      @stack = []
    end

    def push item
      @stack.push item
    end

    def pop
      raise "Stack is empty" if empty?
      @stack.pop
    end

    def peek
      @stack.last
    end

    def empty?
      @stack.empty?
    end

    def size
      @stack.size
    end

    alias_method :<<, :push
  end
end

