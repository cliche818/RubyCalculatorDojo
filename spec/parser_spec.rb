require 'spec_helper'

describe Parser do
  describe('#run') do
    [['2+2',[2.0, :+, 2.0]],
     ['2+2+1',[2.0, :+, 2.0, :+, 1.0]],
     ['22+2',[22.0, :+, 2.0]],
     ['22.2+2', [22.2, :+, 2.0]],
     ['(22+22)*2', [:'(', 22.0, :+, 22.0, :')', :*, 2.0]],
     ['((22+22)+3)*4', [:'(', :'(', 22.0, :+, 22.0, :')', :+, 3.0,:')', :*, 4.0]]
    ].each do |test|
      it "should parse #{test[0]} into an array" do
        array = Parser.run(test[0])
        expect(array).to eq(test[1])
      end
    end
  end
end