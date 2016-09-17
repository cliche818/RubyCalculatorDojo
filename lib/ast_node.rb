class AstNode
  attr_reader :operator, :arg1, :arg2

  def initialize(operator, arg1, arg2)
    @operator = operator
    @arg1 = arg1
    @arg2 = arg2
  end

  def evaluate
    arg1_evaluated_value = @arg1
    if @arg1.class == AstNode
      arg1_evaluated_value = @arg1.evaluate
    end

    arg2_evaluated_value = @arg2
    if @arg2.class == AstNode
      arg2_evaluated_value = @arg2.evaluate
    end

    Operation.run(@operator, arg1_evaluated_value, arg2_evaluated_value)
  end

  def ==(ast_node)
    @operator == ast_node.operator && @arg1 == ast_node.arg1 && @arg2 == ast_node.arg2
  end
end