require 'Barrier.rb' 


describe Barrier do
  let(:card) { Oystercard.new }
  describe '#touch_in' do
    it 'Touch_in changes journey status to true' do
      expect(subject.touch_in(card)).to eq true
    end
  end
end