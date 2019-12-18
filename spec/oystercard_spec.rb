require "oystercard.rb"

describe Oystercard do

  it 'Test that card holds an amount of money' do

    expect(subject.card_balance).to eq(0) # no creating instance prior to test
  end


  describe '#top_up' do
    # it 'Test top_up adds amount to variable' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'Test when amount is added to top_up' do

      expect { subject.top_up Oystercard::FAIR  }.to change { subject.card_balance }.by Oystercard::FAIR 
    end

    it 'Test limit of card_balance to eq 90' do
      card_limit = Oystercard::DEAFULT_LIMIT #set card_limit to eq default limit
      subject.top_up(card_limit) #call default limit on top_up to set car amount to default 
      expect { subject.top_up Oystercard::FAIR  }.to raise_error 'You have reached the limit of £90' # not add one to car which will make amount 1 over 90 
    end
  end

  describe "#deduct" do
    it 'Takes amount from balance' do
      expect { subject.deduct Oystercard::FAIR }.to change{ subject.card_balance }.by -Oystercard::FAIR 
    end
  end 

  describe "#journey" do
    it 'Test journey is false at creation' do
      expect(subject).not_to be_in_journey
    end
    it 'Test touch_in converts journey to true' do
      subject.top_up(5)
      subject.touch_in
      expect(subject).to be_in_journey
    end
    it 'Test after touch_out journey is false' do
      subject.top_up(5)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end 

  describe 'minimum fair' do
    it 'Tests that balance less than fair stops touch_in' do
      expect { subject.touch_in }.to raise_error "Sorry you don't have enough!!"
    end
    it 'On touch out remove fare' do
      subject.top_up(5)
      subject.touch_in
      expect { subject.touch_out }.to change { subject.card_balance }.by 1
    end
  end
  #   end
end

#   let(:card) { Oystercard.new }
#   describe '#touch_in' do
#     it 'Touch_in changes journey status to true' do
#       expect(subject.start(card)).to eq true
#     end
#   end

#   describe '#touch_out' do
#     it 'Touch_out changes journey to false' do
#       expect(subject.stop(card)).to eq false
#     end
#   end
# end    



# describe Oystercard do
#   let(:card) { Oystercard.new }
#   describe '#touch_in' do
#     it 'Touch_in changes journey status to true' do
#       expect(subject.touch_in(card)).to eq true
#     end
#   end

#   describe '#touch_out' do
#     it 'Touch_out changes journey to false' do
#       expect(subject.touch_out(card)).to eq false
#     end
#   end

#   context 'has a balance of zero' do
#     it 'raises error when no minimum balance' do
#       expect { subject.touch_in(card) }.to raise_error "Sorry you don't have enough!!"
#     end
#   end
# end

  # describe '#top_up' do
  #   it 'Test top_up respond to 1 argument' do

  #     it { is_expected.to respond_to(:top_up).with(1).argument }
  #   end

  #   it 'Test add amount to top up card' do

  #     expect(subject.top_up(10)).to eq(subject.card_balance(10))



  #       