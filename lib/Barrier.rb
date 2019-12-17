# require 'oystercard.rb'

class Barrier

  # FAIR = 1

  def touch_in(card)
    card.touch_in
  end

  def touch_out(card)
    card.touch_out
  end

end