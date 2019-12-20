class JourneyLog

  def initialize(journey_class = Journey)
    create_journey_history
    @journey_class = journey_class
  end

  def start(entry_station)
    @journey_history << @journey_class.new(entry_station)
  end

  def finish(exit_station)
    start(nil) if @journey_history.empty?
    current_journey.finish_journey(exit_station)
  end

  def journeys
    @journey_history
  end

 
private
  
  def create_journey_history
    @journey_history = []
  end

  def current_journey
    @journey_history.last
  end

end