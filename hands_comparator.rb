class HandsComparator

  WHITE_NAME = "white"
  BLACK_NAME = "black"

  def compare_hands(white_hand, black_hand)
    pair_result = compare_by_pair white_hand, black_hand
    return pair_result if pair_result
    return compare_by_higher_card(white_hand, black_hand)
  end

  def compare_by_pair(white_hand, black_hand)
    return HandsPairComparator.compare_objects_by_value(white_hand, black_hand)
  end

  def compare_by_higher_card(white_hand, black_hand)
    sorted_white = white_hand.sort.reverse
    sorted_black = black_hand.sort.reverse

    number_of_cards = white_hand.length-1
    (0..number_of_cards).each do |n|
      white_card = sorted_white[n]
      black_card = sorted_black[n]
      return HigherCardResult.new(WHITE_NAME, white_card) if white_card.stronger_than black_card
      return HigherCardResult.new(BLACK_NAME, black_card) if black_card.stronger_than white_card
    end
    return EqualityResult.new
  end
end