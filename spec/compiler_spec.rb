require 'spec_helper'

describe Compiler do
  describe '.run' do

    [
        [[2.0, :+, 2.0], AstNode.new(:+, 2.0, 2.0)],
        [[2.0, :+, 1.0, :-, 3.0], AstNode.new(:-, AstNode.new(:+, 2.0, 1.0), 3.0)]
    ].each do |test|
      it "should take an #{test[0]} and turn it into a abstract syntax tree" do
        ast_node = Compiler.run(test[0])
        expect(ast_node).to eq(test[1])
      end
    end
  end
end