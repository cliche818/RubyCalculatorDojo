require 'spec_helper'

describe Operation do
  describe '.run' do
    it 'should add 2 numbers if given :+ and 2 numbers' do
      expect(Operation.run(:+, 1, 1)).to eq(2)
    end

    it 'should subtract 2 numbers if given :- and 2 numbers' do
      expect(Operation.run(:-, 2, 1)).to eq(1)
    end
  end
end