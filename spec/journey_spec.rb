require 'journey'

describe Journey do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  describe '#initialize' do
    it 'initializes a journey with an entry station' do
      subject = described_class.new(entry_station)
      expect(subject.entry_station).to eq(entry_station)
    end

    describe '#finish_journey' do
      it 'updates journey with exit station' do
        subject = described_class.new(entry_station)
        subject.finish_journey(exit_station) 
        expect(subject.exit_station).to eq(exit_station)
      end
    end

    describe '#fare' do
      it 'returns minimum fare if entry_station and exit_station are present' do
        subject = described_class.new(entry_station)
        subject.finish_journey(exit_station)
        expect(subject.fare).to eq(described_class::MINIMUM_FARE)
      end

      it 'returns journey fare or penalty' do
        subject = described_class.new(entry_station)
      end

      it 'returns journey fare or penalty' do
        subject = described_class.new(entry_station)
      end

    end


  end
end