require "oystercard.rb"

describe Oystercard do

  it 'Test that card holds an amount of money' do

    expect(subject.card_balance).to eq(0) # no creating instance prior to test
  end


  describe '#top_up' do
    # it 'Test top_up adds amount to variable' do

    it { is_expected.to respond_to(:top_up).with(1).argument }
  end

  describe "#top_up" do
    it 'Test when amount is added to top_up' do

      expect{ subject.top_up 1 }.to change{ subject.card_balance }.by 1
    end
  end

  describe "#top_up" do
    it 'Test limit of card_balance to eq 90' do
      card_limit = Oystercard::DEAFULT_LIMIT #set card_limit to eq default limit
      subject.top_up(card_limit) #call default limit on top_up to set car amount to default 
      expect { subject.top_up 1 }.to raise_error 'You have reached the limit of £90' # not add one to car which will make amount 1 over 90 
    end
  end

  describe "#deduct" do
    it 'Takes amount from balance' do
      expect{ subject.deduct 1 }.to change{ subject.card_balance }.by -1
    end
  end 
end


  # describe '#top_up' do
  #   it 'Test top_up respond to 1 argument' do

  #     it { is_expected.to respond_to(:top_up).with(1).argument }
  #   end

  #   it 'Test add amount to top up card' do

  #     expect(subject.top_up(10)).to eq(subject.card_balance(10))



  #       