require_relative "card"
require_relative "results"
require_relative "pair"
require_relative "card_stack"
require_relative "high_card"

class Deck < CardStack

  def search_discriminator (challenger)
    discriminator_index = (0..(@cards.length-1)).find { |i|
      card = @cards[i]
      challenger_card = challenger[i]
      card.stronger_than challenger_card
    }
    @cards[discriminator_index] if discriminator_index
  end

  def search_first_pair
    return if count_card < 2
    previous = @cards[0]
    @cards[1..-1].each { |current_card|
      if current_card.as_strong_as previous
        pair = generate_pair_from(current_card, previous)
        return pair
      end
      previous = current_card
    }
    #noinspection RubyUnnecessaryReturnStatement
    return
  end

  def generate_pair_from(gemel_card_1, gemel_card_2)
    pair_cards = Deck.new [gemel_card_2, gemel_card_1]
    kickers = self - pair_cards
    Pair.new pair_cards, kickers
  end

  def search_best_hand
    search_first_pair || to_high_card
  end

  def to_high_card
    HighCard.new self
  end

  def print
    to_s
  end

end