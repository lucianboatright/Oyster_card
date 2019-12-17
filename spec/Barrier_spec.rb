require 'Barrier.rb' 


describe Barrier do
  let(:card) { Oystercard.new }
  describe '#touch_in' do
    it 'Touch_in changes journey status to true' do
      expect(subject.touch_in(card)).to eq true
    end
  end

  describe '#touch_out' do
    it 'Touch_out changes journey to false' do
      expect(subject.touch_out(card)).to eq false
    end
  end
end