class Compiler
  OPERATOR_TIER = {:+ => 1, :- => 1, :* => 2, :/ => 2}
  BRACKET_TIER_BOOST = 10000

  def initialize
    @base_tier_level = 0
  end

  def run(parsed_equation)
    abstract_syntax_tree = nil
    operator = nil
    operator_tier = 0
    parsed_equation.each do |token|
      if token == :'('
        @base_tier_level += BRACKET_TIER_BOOST
      elsif token == :')'
        @base_tier_level -= BRACKET_TIER_BOOST
      elsif operator_token?(token)
        operator = token
        operator_tier = OPERATOR_TIER[operator] + @base_tier_level
      elsif abstract_syntax_tree.nil?
        abstract_syntax_tree = token
      else
        second_arg = token
        if operator_is_higher_priority?(abstract_syntax_tree, operator_tier)
          second_arg = AstNode.new(operator, abstract_syntax_tree.arg2, second_arg, operator_tier)
          abstract_syntax_tree.arg2 = second_arg
        else
          abstract_syntax_tree = AstNode.new(operator, abstract_syntax_tree, second_arg, operator_tier)
        end
      end
    end

    abstract_syntax_tree
  end

  private

  def operator_token?(token)
    token.is_a?(Symbol)
  end

  def operator_is_higher_priority?(abstract_syntax_tree, operator_tier)
    if !abstract_syntax_tree.is_a?(AstNode)
      false
    else
      operator_tier > abstract_syntax_tree.tier
    end
  end
end