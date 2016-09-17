class Parser
  def self.run(equation_string)
    parsed_equation = []
    token = ''
    equation_string.each_char do |char|
      if char =~ /[0-9.]/
        token << char
      else
        parsed_equation << token.to_f
        token = ''
        parsed_equation << char.to_sym
      end
    end

    parsed_equation << token.to_f
    parsed_equation
  end
end