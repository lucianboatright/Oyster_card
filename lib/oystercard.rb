
class Oystercard

  DEAFULT_LIMIT = 90

  attr_reader :card_balance, :journey_history

  def initialize
    @card_balance = 0
    @journey_history = []
  end

  def top_up(amount)
    fail 'You have reached the limit of £90' if amount + @card_balance > DEAFULT_LIMIT
    @card_balance += amount
  end

  def touch_in(entry_station)

    fail "Sorry you don't have enough!!" if @card_balance < 1
    @journey_history <<  Journey.new(entry_station)
  end  

  def touch_out(exit_station)
    @journey_history.last.finish_journey(exit_station)
    deduct(@journey_history.last.fare)
    @entry_station = nil
  end

  def in_journey?
    return false if @journey_history.empty?
    !@journey_history.last.complete?
  end

  private

  def deduct(fare)
    @card_balance -= fare
  end
end

