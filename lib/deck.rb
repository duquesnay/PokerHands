require_relative "card"
require_relative "results"
require_relative "pair"
require_relative "card_stack"
require_relative "high_card"
require_relative "doublets_enumerator"
require_relative "deck_interpreter"

class Deck < CardStack

  def search_best_hand
    search_first_pair || to_high_card
  end

  def search_first_pair
    DoubletsEnumerator.each_pair_of(self) { |left_card, right_card|
      return generate_pair_from(left_card) if are_pair?(left_card, right_card)
    }
    #noinspection RubyUnnecessaryReturnStatement
    return
  end

  def are_pair?(left_card, right_card)
    left_card.same_value? right_card
  end

  def generate_pair_from(sample_card)
    kickers = extract_kickers sample_card
    sample_card.wrap_to_pair(kickers)
  end

  def extract_kickers(sample_pair_card)
    remaining_cards = reject_cards_like(sample_pair_card)
    self.class.new remaining_cards
  end

  def to_high_card
    HighCard.new self
  end

  private
  def reject_cards_like(sample_pair_card)
    @cards.reject { |card| are_pair?(card, sample_pair_card) }
  end

end