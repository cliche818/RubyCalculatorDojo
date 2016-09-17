class Operation
  def self.run(operator, arg1, arg2)
    if operator == :+
      arg1 + arg2
    elsif operator == :-
      arg1 - arg2
    end
  end
end