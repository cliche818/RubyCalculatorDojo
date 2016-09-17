class Parser
  def self.run(equation_string)
    parsed_equation = []
    token = ''
    equation_string.each_char do |char|
      if number_char?(char)
        token << char
      else
        if token != ''
          parsed_equation << token.to_f
          token = ''
        end

        parsed_equation << char.to_sym
      end
    end

    parsed_equation << token.to_f
    parsed_equation
  end

  class << self
    private
    def number_char?(char)
      char =~ /[0-9.]/
    end
  end
end