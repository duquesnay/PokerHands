require_relative "card"
require_relative "results"
require_relative "pair"
require_relative "card_stack"
require_relative "high_card"

class Deck < CardStack

  def search_first_pair
    return if count_card < 2
    previous = @cards[0]
    @cards[1..-1].each { |current_card|
      return generate_pair_from(current_card) if current_card.same_value? previous
      previous = current_card
    }
    #noinspection RubyUnnecessaryReturnStatement
    return
  end

  def generate_pair_from(sample_card)
    kickers = extract_kickers sample_card
    sample_card.wrap_to_pair(kickers)
  end

  def extract_kickers(sample_pair_card)
    remaining_cards = @cards.reject { |card| card.same_value? sample_pair_card }
    self.class.new remaining_cards
  end

  def search_best_hand
    search_first_pair || to_high_card
  end

  def to_high_card
    HighCard.new self
  end

  def self.to_deck(deck_representation)
    symbols = deck_representation.split(' ')

    cards = symbols.collect { |symbol_card|
      Card.to_card(symbol_card)
    }
    Deck.new cards
  end

  def to_s
    @cards.join " "
  end

end