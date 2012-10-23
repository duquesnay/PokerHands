class CardStack
  @cards

  def initialize(cards=[])
    @cards = []
    cards.each {
        |card| @cards<<card
    }
    ensure_order
  end

  def [](stuff)
    expected_result = @cards[stuff]
    return Deck.new(expected_result) if expected_result.instance_of? Array
    expected_result
  end

  def search_discriminator (card_stack)
    discriminator_index = (0..(@cards.length-1)).find { |i|
      card = @cards[i]
      challenger_card = card_stack[i]
      card.stronger_than? challenger_card
    }
    @cards[discriminator_index] if discriminator_index
  end

  private
  def ensure_order
    @cards.sort!{ |a,b| a.compare_strength b }
    @cards.reverse!
  end

  def count_card
    @cards.length
  end

end