require 'oystercard'

class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station

  def initialize(entry_station)
    @entry_station = entry_station
  end

  def finish_journey(exit_station)
    @exit_station = exit_station
  end

  def fare
    MINIMUM_FARE
  end

end