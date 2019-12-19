require 'journey'
require 'oystercard'

describe Journey do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  it 'penalty chard deducted if touch in or out not completed' do
    subject.top_up(20)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.PENALTY).to change(card_balance).by -15
  end
end