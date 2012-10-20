require "test/unit"
require_relative "../lib/deck"

class DeckTest < Test::Unit::TestCase

  def test_pick_higher_pair
    #G
    black=Deck.to_deck "kh 2h 4s 4d 5s"
    #W
    higher_pair = black.search_best_hand
    #T
    assert higher_pair
  end

  def test_extract_lower_deck
    #G
    black=Deck.to_deck "kh 2h 4s 4d 5s"
    #W
    result = black.extract_lower_deck
    #T
    assert_equal "[5s, 4s, 4d, 2h]", result.to_s
  end

  def test_extract_lower_deck_remains_empty_on_empty_deck
    #G
    black=Deck.new
    #W
    result = black.extract_lower_deck
    #T
    assert_equal "[]", result.to_s
  end

  def _test_pick_a_pair_get_proper_kickers
    #G
    black=Pair.new Deck.to_deck"kh 2h 3s 4d 5s"
    #W
    higher_pair = black.search_best_hand
    #T
    assert_equals "kh 4d 2h", higher_pair.print_kickers
  end

  def test_best_hand_found_if_no_pair
    #G
    black=Deck.to_deck "kh 2h 3s 4d 5s"
    #W
    best_hand = black.search_best_hand
    #T
    assert_not_nil best_hand
  end

  def test_dont_pick_pair_when_one_card
    #G
    black=Deck.to_deck "kh"
    #W
    hand_found = black.search_best_hand
    #T
    assert_false hand_found.instance_of? Pair
  end

end