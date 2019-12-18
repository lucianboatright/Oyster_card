class Oystercard

  DEAFULT_LIMIT = 90
  FAIR = 1


  # attr_reader :in_journey
  attr_reader :card_balance

  def initialize
    @journey = false
    @card_balance = 0
  end

  def top_up(amount)
    fail 'You have reached the limit of £90' if amount + @card_balance > DEAFULT_LIMIT
    @card_balance += amount
  end

  def deduct(amount)
    @card_balance -= amount
  end

  def touch_in

    raise "You are already in a journey" if @journey == true

    fail "Sorry you don't have enough!!" if @card_balance < FAIR

    @journey = true
  end  

  def touch_out
    raise "You are already out of the journey" if @journey == false
    @journey = false
  end

  def in_journey?
    @journey
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
