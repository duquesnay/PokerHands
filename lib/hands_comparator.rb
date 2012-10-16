require_relative "comparator"
require_relative "high_card"
require_relative "hands_pair_comparator"
require_relative "gamers"

class HandsComparator
  include Gamers

  def compare_hands(white_hand, black_hand)
    pair_result = compare_by_pair white_hand, black_hand
    return pair_result if pair_result
    return compare_by_higher_card(white_hand, black_hand)
  end

  def compare_by_pair(white_hand, black_hand)
    HandsPairComparator.compare_objects_by_value(white_hand, black_hand)
  end

  def compare_by_higher_card(white_hand, black_hand)
    HighCard.compare_objects_by_value white_hand, black_hand
  end

end