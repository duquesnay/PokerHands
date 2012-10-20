class CardStack
  @cards

  def initialize(cards=[])
    @cards = []
    cards.each {
        |card| @cards<<card
    }
    ensure_order
  end

  def <<(card)
    @cards << card
    ensure_order
  end

  def []=(y, value)
    @cards[y]=value
    ensure_order
  end

  def -(deck)
    cards_to_remove = deck.to_cards_a
    remaining_cards = @cards - cards_to_remove
    Deck.new remaining_cards
  end

  def [](stuff)
    expected_result = @cards[stuff]
    return Deck.new(expected_result) if expected_result.instance_of? Array
    return expected_result
  end

  def to_s
    @cards.to_s
  end

  def each
    @cards.each { |card| yield }
  end

  def self.to_deck deck_representation
    symbols = deck_representation.split(' ')

    cards = symbols.collect { |symbol_card|
      Card.to_card(symbol_card)
    }
    Deck.new cards
  end

  private
  def ensure_order
    @cards.sort!{ |a,b| a.compare_strength b }
    @cards.reverse!
  end


end