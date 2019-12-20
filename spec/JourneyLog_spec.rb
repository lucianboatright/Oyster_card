require 'JourneyLog'
describe JourneyLog do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  describe '#start' do
    it 'creates new journey and adds it to journey history on touching in for first time' do
      subject.start(entry_station)
      expect(subject.journey_history.length).to eq 1
    end

    it 'creates new journey and adds it to journey history on touching in twice without touch out' do
      subject.start(entry_station)
      subject.start(entry_station)
      expect(subject.journey_history.length).to eq 2
    end
  end
end