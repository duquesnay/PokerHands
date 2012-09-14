require "./card"
require "./result"
require "./pair"
require "./hands_comparator"

class Hand < Deck

  def compare(black_hand)
    HandsComparator.new.compare_hands(self, black_hand)
  end

  def pick_first_pair
    return if length < 2
    sorted_hand = self.sort
    previous = sorted_hand.first
    sorted_hand[1..-1].each do |current_card|
      return Pair.new previous, current_card if current_card.as_strong_as previous
      previous = current_card
    end
    return
  end

  def tell_first_pair(visitor)
    visitor.gather_value pick_first_pair
  end

  def self.to_hand hand_representation
    symbols = hand_representation.split(' ')
    hand = Hand.new
    symbols.each { |symbol_card|
      hand << Card.to_card(symbol_card)
    }
    hand
  end

end