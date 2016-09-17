require 'spec_helper.rb'

describe AstNode do
  describe '#evaluate' do
    it 'should run the operation of a single Ast Node' do
      ast_node = AstNode.new(:+, 2, 2)
      expect(ast_node.evaluate).to eq(4)
    end

    it 'should run the operation of an Ast Node with 1 child' do
      child_ast_node = AstNode.new(:+, 2, 2)
      parent_ast_node = AstNode.new(:+, 3, child_ast_node)
      expect(parent_ast_node.evaluate).to eq(3+4)
    end

    it 'should run the operation of an Ast Node with 2 child' do
      child_ast_node = AstNode.new(:+, 2, 2)
      child2_ast_node = AstNode.new(:+, 1, 1)
      parent_ast_node = AstNode.new(:+, child_ast_node, child2_ast_node)
      expect(parent_ast_node.evaluate).to eq(4+2)
    end

    it 'should run the operation of an Ast Node of 3 levels' do
      grandchild_ast_node = AstNode.new(:+, 2, 2)
      child_ast_node = AstNode.new(:+, 2, grandchild_ast_node)
      child2_ast_node = AstNode.new(:+, 1, 1)
      parent_ast_node = AstNode.new(:+, child_ast_node, child2_ast_node)
      expect(parent_ast_node.evaluate).to eq(4+2+2)
    end
  end
end
