require 'spec_helper'

describe Compiler do
  describe '.run' do

    [
        [[2, :+, 2], AstNode.new(:+, 2, 2)],
        [[2, :+, 1, :-, 3], AstNode.new(:-, AstNode.new(:+, 2, 1), 3)],
        [[2, :+, 1, :*, 3], AstNode.new(:+, 2, AstNode.new(:*, 1, 3))],
        [[2, :*, 1, :+, 3, :*, 4], AstNode.new(:+, AstNode.new(:*, 2, 1), AstNode.new(:*, 3, 4))]
    ].each do |test|
      it "should take an #{test[0]} and turn it into a abstract syntax tree" do
        ast_node = Compiler.run(test[0])
        expect(ast_node).to eq(test[1])
      end
    end
  end
end