class CardStack
  @cards

  def initialize(cards=[])
    @cards = Array.new cards
    ensure_order
  end

  def each
    @cards.each
  end

  def search_discriminator (card_stack)
    challengers_enumerator = card_stack.each
    @cards.find{ |card|
      challenger = challengers_enumerator.next
      card.stronger_than? challenger
    }
  end

  def to_s
    @cards.join " "
  end

  private
  def ensure_order
    @cards.sort!{ |a,b| a.compare_strength b }
    @cards.reverse!
  end

end