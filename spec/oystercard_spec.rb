
require "oystercard.rb"

describe Oystercard do

  it 'Test that card holds an amount of money' do

    expect(subject.card_balance).to eq(0) # no creating instance prior to test
  end


  describe '#top_up' do
    # it 'Test top_up adds amount to variable' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'Test when amount is added to top_up' do

      expect { subject.top_up(20)  }.to change { subject.card_balance }.by 20
    end

    it 'Test limit of card_balance to eq 90' do
      card_limit = Oystercard::DEAFULT_LIMIT #set card_limit to eq default limit
      subject.top_up(card_limit) #call default limit on top_up to set car amount to default 
      expect { subject.top_up(20)  }.to raise_error 'You have reached the limit of £90' # not add one to car which will make amount 1 over 90 
    end
  end

  describe '#touch_in' do
    let(:entry_station) { double :station }
    let(:exit_station) { double :station }

    it 'is prevented when balance is less than fare' do
      expect { subject.touch_in(entry_station) }.to raise_error "Sorry you don't have enough!!"
    end

    it 'attaches station to attribute' do
      subject.top_up(5)
      subject.touch_in(entry_station)
      expect(subject.journey_history.length).to eq 1 
    end
  end

  describe '#touch_out' do
    let(:entry_station) { double :station }
    let(:exit_station) { double :station }
   
    it 'updates balance by minimum fare' do
      subject.top_up(5)
      subject.touch_in(entry_station)
      expect { subject.touch_out(exit_station) }.to change { subject.card_balance }.by -1
    end
  end

  describe "#in_journey?" do 
    let(:entry_station) { double :station }
    let(:exit_station) { double :station }
    it 'is false at creation' do
      expect(subject).not_to be_in_journey
    end
    it 'returns true after touch in' do
      subject.top_up(5)
      subject.touch_in(entry_station)
      expect(subject).to be_in_journey
    end
    it 'returns false after touch in and touch out' do
      subject.top_up(5)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject).not_to be_in_journey
    end
  end 
end




# require "oystercard.rb"

# describe Oystercard do

#   it 'Test that card holds an amount of money' do

#     expect(subject.card_balance).to eq(0) # no creating instance prior to test
#   end


#   describe '#top_up' do
#     # it 'Test top_up adds amount to variable' do
#     it { is_expected.to respond_to(:top_up).with(1).argument }

#     it 'Test when amount is added to top_up' do

#       expect { subject.top_up Oystercard::FAIR  }.to change { subject.card_balance }.by Oystercard::FAIR 
#     end

#     it 'Test limit of card_balance to eq 90' do
#       card_limit = Oystercard::DEAFULT_LIMIT #set card_limit to eq default limit
#       subject.top_up(card_limit) #call default limit on top_up to set car amount to default 
#       expect { subject.top_up Oystercard::FAIR  }.to raise_error 'You have reached the limit of £90' # not add one to car which will make amount 1 over 90 
#     end
#   end

#   describe "#deduct" do
#     it 'Takes amount from balance' do
#       # subject.top_up(5)
#       expect { subject.deduct Oystercard::FAIR }.to change{ subject.card_balance }.by -Oystercard::FAIR 
#     end
#   end 

#   describe "#journey" do
#     let(:station) { double :station }
#     it 'Test journey is false at creation' do
#       expect(subject).not_to be_in_journey
#     end
#     it 'Test touch_in converts journey to true' do
#       subject.top_up(5)
#       subject.touch_in(station)
#       expect(subject).to be_in_journey
#     end
#     it 'Test after touch_out journey is false' do
#       subject.top_up(5)
#       subject.touch_in(station)
#       subject.touch_out
#       expect(subject).not_to be_in_journey
#     end
#   end 

#   describe 'minimum fair' do
#     let(:station) { double :station }
#     it 'Tests that balance less than fair stops touch_in' do
#       expect { subject.touch_in(station) }.to raise_error "Sorry you don't have enough!!"
#     end
#     it 'Test that touch_out removes fair from card balance' do
#       subject.top_up(5)
#       subject.touch_in(station)
#       expect { subject.touch_out }.to change { subject.card_balance }.by -Oystercard::FAIR
#     end
#   end

#   describe "location change" do
#     let(:station) { double :station }
#     it  'stores the station on touch_in call' do
#       subject.top_up(5)
#       subject.touch_in(station)
#       expect(subject.entry_station).to eq station
#     end
#   end
# end


  #   let(:location) { Oystercard.new }
  #   it 'Test that touch_in adds location to card attribute' do
  #     subject.top_up(5)
  #     expect { subject.touch_in(location) }.to change { subject }.by location
  #   end
  # end


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