class JourneyLog

  attr_reader :journey_history

  def initialize(journey_class = Journey)
    @journey_history = []
    @journey_class = journey_class
  end

  def start(entry_station)
    @journey_history << @journey_class.new(entry_station)
  end

  def finish(exit_station)
    start(nil) if @journey_history.empty?
    @journey_history.last.finish_journey(exit_station)
  end


end