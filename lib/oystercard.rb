class Oystercard

  DEAFULT_LIMIT = 90
  FAIR = 1

  attr_reader :card_balance, :entry_station, :journey_history

  def initialize
    @card_balance = 0
    # @entry_station = entry_station
    # @exit_station = exit_station
    @journey_history = []
  end

  def top_up(amount)
    fail 'You have reached the limit of £90' if amount + @card_balance > DEAFULT_LIMIT
    @card_balance += amount
  end

  def touch_in(entry_station)

    fail "Sorry you don't have enough!!" if @card_balance < 1
    @entry_station = entry_station
    @journey = Hash.new
    @journey["#{@entry_station}"] = nil
  end  

  def touch_out(exit_station)
    # raise "You are already out of the journey" if @journey == false
    # @journey = false
    # @card_balance -= FAIR
    deduct
    @journey["#{@entry_station}"] = "#{exit_station}"
    @journey_history << @journey
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  # private

  def deduct
    @card_balance -= FAIR
  end

  #########
  # def start(card)
  #   # if @card_balance < FAIR
  #   #   raise "Sorry you don't have enough!!"
  #   card.touch_in
  #   # end
  # end

  # def stop(card)
  #   card.touch_out
  # end
###########


end








# class Barrier

#   FAIR = 1

#   def touch_in(card)
#     # if @card_balance < FAIR
#     #   raise "Sorry you don't have enough!!"
#     card.touch_in
#     # end
#   end

#   def touch_out(card)
#     card.touch_out
#   end

# end


# class Oystercard
#   DEAFULT_LIMIT = 90

#   attr_reader :card_balance

#   def initialize
#     @card_balance = 0
#   end

#   def top_up(amount)
#     fail 'You have reached the limit of £90' if amount + @balance > DEAFULT_LIMIT
#     @card_balance += amount 
#   end
# end
