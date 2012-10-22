require_relative "deck"

class HighCard

  def initialize (deck)
    @deck = deck
  end

  def resolve_against (challenged_hand)
    winning_card = challenged_hand.search_discriminator_of @deck
    HighCardResolution.from_card winning_card if winning_card
  end

  def search_discriminator_of (challenging_deck)
    challenging_deck.search_discriminator @deck
  end

end