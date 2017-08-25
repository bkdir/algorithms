#
# Uses Dijkstra's Two Stack algorithm.  
# Works only with fully parenthesised strings.
#
# Ex: 
#  arithmetic_expression = "(3+((2*3)*(4*7)))"
#  puts ArithmeticExpressionEvaluator.evaluate(arithmetic_expression)
#
require_relative 'stack_linked_list_implementation'

class ArithmeticExpressionEvaluator
  include Algorithms

  @operators = LinkedListStack.new
  @operands = LinkedListStack.new

  class << self
    def evaluate str
      str.each_char do |c|
        case c
        when /[0-9]/ then @operands.push c
        when *%w(+ - * /) then @operators.push c
        when ")" then @operands.push pop_and_calculate
        end
      end
      @operands.pop
    end

    def pop_and_calculate 
      val1 = @operands.pop.to_i
      val2 = @operands.pop.to_i

      case @operators.pop
      when '+' then val1 + val2
      when '-' then val1 - val2
      when '*' then val1 * val2
      when '/' then val1 / val2
      end
    end
  end
end
