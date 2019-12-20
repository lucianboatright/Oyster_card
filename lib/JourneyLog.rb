class JourneyLog

  attr_reader :journey_history

  def initialize(journey_class = Journey)
    @journey_history = []
    @journey_class = journey_class
  end

  def start(entry_station)
    @journey_history << @journey_class.new(entry_station)
  end


end