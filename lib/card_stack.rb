class CardStack
  @cards

  def initialize(cards=[])
    @cards = Array.new cards
    ensure_order
  end

  def enumerate_cards
    @cards.each
  end

  def search_discriminator (card_stack)
    challengers_enumerator = card_stack.enumerate_cards
    @cards.find{ |card|
      challenger = challengers_enumerator.next
      card.stronger_than? challenger
    }
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