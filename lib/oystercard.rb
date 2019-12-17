class Oystercard
  DEAFULT_LIMIT = 90

  attr_reader :card_balance

  def initialize(limit=DEFAULT_LIMIT)
    @limit = limit
    @card_balance = 0
  end

  def top_up(amount)
    @card_balance += limit 
  end

  def limit(limit)
    if @card_balance + top_up > @limit
      raise 'You have reached the limit of £90'
    else
      topup(amount)
    end
  end
end
