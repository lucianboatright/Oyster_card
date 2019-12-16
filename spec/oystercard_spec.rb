require "oystercard.rb"

describe Oystercard do

  it 'Test that card holds an amount of money' do
    Oystercard = Card.new(50)
    expect{ subject(50) }.to eq (50)
  end

end