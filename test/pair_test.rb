require "test/unit"
require_relative "../lib/pair"
require_relative "../lib/hands_comparator"
require_relative "../lib/hands_pair_comparator"
require_relative "../lib/hand"

class PairTest < Test::Unit::TestCase

  def test_should_be_superior_to_lower_pair
    #G
    white_pair = Pair.new (Card.to_card "4s"), (Card.to_card "4d")
    black_pair = Pair.new (Card.to_card "2s"), (Card.to_card "2d")

    #W
    result = white_pair > black_pair

    #T
    assert(result);
  end

  def test_should_be_inferior_to_higher_pair
    #G
    white_pair = Pair.new (Card.to_card "4s"), (Card.to_card "4d")
    black_pair = Pair.new (Card.to_card "2s"), (Card.to_card "2d")

    #W
    result = white_pair < black_pair

    #T
    assert(!result);
  end

  def test_compare_pairs
    #G
    white="ks 2s 4h 3h 5h"
    black="kh 2h 4s 4d 5s"
    white_hand = Hand.to_hand white
    black_hand = Hand.to_hand black

    #W
    HandsPairComparator.compare_objects_by_value white_hand, black_hand
    result = white_hand.compare(black_hand)

    #T
    assert_match /a pair of 4/, result.print_pair
  end

  def test_should_name_black_winner_on_first_pair_bigger
    #G
    pair_of_4_string="kh 2h 4s 4d 5s"
    high_card_king_string="ks 2s 4h 3h 5h"
    pair_of_4 = Hand.to_hand pair_of_4_string
    high_card_king = Hand.to_hand high_card_king_string

    #W
    result = HandsPairComparator.compare_objects_by_value high_card_king, pair_of_4

    #T
    assert_match /^black/, result.print_result
  end

  def test_should_name_a_winner_on_kicker
    #G
    pair_of_4_kicker_king_input="kh 2h 4s 4d 5s"
    pair_of_4_kicker_queen_input="qs 2s 4h 4h 5h"
    pair_of_4_kicker_king = Hand.to_hand pair_of_4_kicker_king_input
    pair_of_4_kicker_queen = Hand.to_hand pair_of_4_kicker_queen_input
    #W
    result = HandsPairComparator.compare_objects_by_value pair_of_4_kicker_king, pair_of_4_kicker_queen

    #T
    assert_not_nil result, "no result after comparison"
  end

  def test_should_name_white_winner_on_second_pair_bigger
    #G
    pair_of_4_string="kh 2h 4s 4d 5s"
    high_card_king_string="ks 2s 4h 3h 5h"
    pair_of_4_hand = Hand.to_hand pair_of_4_string
    high_card_king = Hand.to_hand high_card_king_string

    #W
    result = HandsPairComparator.compare_objects_by_value pair_of_4_hand, high_card_king

    #T
    assert_match /^white/, result.print_result
  end

end