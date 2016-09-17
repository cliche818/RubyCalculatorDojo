class AstNode
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
end