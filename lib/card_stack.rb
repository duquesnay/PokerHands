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

  def each
    @cards.each { |card| yield card }
  end

  def -(deck_to_substract)
    remaining_cards = @cards.clone
    deck_to_substract.each{ |card_to_remove| remaining_cards.delete card_to_remove}
    Deck.new remaining_cards
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