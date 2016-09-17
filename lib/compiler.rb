class Compiler
  OPERATOR_TIER = { :+ => 1, :- => 1, :* => 2, :/ => 2 }

  def self.run(parsed_equation)
    abstract_syntax_tree = parsed_equation.first
    operator = nil
    parsed_equation.drop(1).each_with_index do |token, index|
      if operator_token?(index)
        operator = token
      else
        second_arg = token
        if operator_is_higher_priority?(abstract_syntax_tree, operator)
          second_arg = AstNode.new(operator, abstract_syntax_tree.arg2, second_arg)
          abstract_syntax_tree.arg2 = second_arg
        else
          abstract_syntax_tree = AstNode.new(operator, abstract_syntax_tree, second_arg)
        end
      end
    end

    abstract_syntax_tree
  end

  class << self
    private

    def operator_token?(index)
      index % 2 == 0
    end

    def operator_is_higher_priority?(abstract_syntax_tree, operator)
      if !abstract_syntax_tree.is_a?(AstNode)
        false
      else
        OPERATOR_TIER[operator] > OPERATOR_TIER[abstract_syntax_tree.operator]
      end
    end
  end
end