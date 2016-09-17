class Compiler
  def self.run(parsed_equation)
    first_arg = parsed_equation.first
    operator = nil
    parsed_equation.drop(1).each_with_index do |token, index|
      if operator_token?(index)
        operator = token
      else
        second_arg = token
        first_arg = AstNode.new(operator, first_arg, second_arg)
      end
    end

    first_arg
  end

  class << self
    private

    def operator_token?(index)
      index % 2 == 0
    end
  end
end