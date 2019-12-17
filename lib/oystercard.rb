class Oystercard

  attr_reader :card_balance

  def initialize
    @card_balance = 0
  end

  def top_up(amount)
    @card_balance += amount 
  end

end
