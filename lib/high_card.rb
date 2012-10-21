require_relative "deck"
require_relative "hand"

class HighCard < Hand

  def initialize deck
    @deck = deck
  end

  def resolve_against challenged_hand
    winning_card = search_discriminator challenged_hand
    return HighCardResolution.new winning_card if winning_card
  end

  def search_discriminator challenged_hand
    challenged_deck = challenged_hand.to_deck
    @deck.search_discriminator challenged_deck
  end

  protected
  def to_deck
    @deck.clone
  end

end