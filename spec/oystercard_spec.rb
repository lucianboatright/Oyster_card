require "oystercard.rb"

describe Oystercard do

  it 'Test that card holds an amount of money' do

    expect(subject.card_balance).to eq(0) # no creating instance prior to test
  end

end