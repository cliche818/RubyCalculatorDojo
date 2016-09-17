require 'spec_helper'

describe Calculator do
  describe '.run' do
    [['2+2',4.0],
     ['2+2+1', 5.0],
     ['22+2', 24.0],
     ['22.2+2', 24.2],
     ['22/2*4', 44],
     ['(22+22)*2', 88],
     ['((22+22)+3)*4', 47 * 4]
    ].each do |test|
      it "should calculate #{test[0]} into a number" do
        expect(Calculator.run(test[0])).to eq(test[1])
      end
    end
  end
end