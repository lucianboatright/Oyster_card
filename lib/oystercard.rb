class Oystercard

  DEAFULT_LIMIT = 90

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
    if @journey == true
      raise "You are already in a journey"
    else 
      @journey = true
    end
  end  

  def touch_out
    # if @journey == false
    #   raise "You are already out of the journey"
    # else
    @journey = false

  end

  def in_journey?
    @journey
  end

end




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
