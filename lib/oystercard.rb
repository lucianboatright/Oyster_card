

class Oystercard

  DEAFULT_LIMIT = 90

  attr_reader :card_balance

  def initialize(journey_log_class = JourneyLog)
    @card_balance = 0
    @journey_log = journey_log_class.new
  end

  def top_up(amount)
    fail 'You have reached the limit of £90' if amount + @card_balance > DEAFULT_LIMIT
    @card_balance += amount
  end

  def touch_in(entry_station)
    fail "Sorry you don't have enough!!" if @card_balance < 1
    @journey_log.start(entry_station)
  end  

  def touch_out(exit_station)
    @journey_log.finish(exit_station)
    deduct(@journey_log.journeys.last.fare)
  end

  def in_journey?
    return false if @journey_log.journeys.empty?
    !@journey_log.journeys.last.complete?
  end

  private

  def deduct(fare)
    @card_balance -= fare
  end
end

