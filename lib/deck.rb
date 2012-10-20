require_relative "card"
require_relative "results"
require_relative "pair"
require_relative "card_stack"

class Deck < CardStack
  def extract_highest_card
    @cards.first
  end

  def extract_lower_deck
    cards_subset = @cards[1..-1]
    return Deck.new cards_subset if cards_subset
    return Deck.new
  end

  def discriminating_card_against? challenger
    discriminator_index = (0..(@cards.length-1)).find { |i|
      card = @cards[i]
      challenger_card = challenger[i]
      card.stronger_than challenger_card
    }
    return @cards[discriminator_index] if discriminator_index
  end

  def count_card
    @cards.length
  end

  def search_first_pair
    previous = @cards[0]
    @cards[1..-1].each { |current_card|
      if current_card.as_strong_as previous
        pair_cards = Deck.new [previous, current_card]
        kickers = self - pair_cards
        return Pair.new pair_cards, kickers
      end
      previous = current_card
    }
    return
  end

  def search_best_hand
    return if count_card < 2

    best_hand = search_first_pair || self
    return best_hand
  end

  def print
    to_s
  end

  protected
  def to_cards_a
    @cards.clone
  end

end