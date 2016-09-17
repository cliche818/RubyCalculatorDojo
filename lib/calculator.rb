class Calculator
  def self.run(string)
    parsed_array = Parser.run(string)
    abstract_syntax_tree = Compiler.new.run(parsed_array)
    abstract_syntax_tree.evaluate
  end
end