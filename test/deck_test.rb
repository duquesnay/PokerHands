require "test/unit"
require_relative "../lib/deck"

#noinspection RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention
class DeckTest < Test::Unit::TestCase

  def test_pick_higher_pair
    #G
    black=Deck.to_deck "kh 2h 4s 4d 5s"
    #W
    higher_pair = black.search_best_hand
    #T
    assert higher_pair
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

  def test_should_find_high_card_as_best_hand
    #G
    black=Deck.to_deck "kh"
    #W
    hand_found = black.search_best_hand
    #T
    assert_instance_of HighCard, hand_found
  end

  def test_should_converts_back_to_a_string_representation
    #G
    unsorted_deck_representation = "ah 4h 5h 3h kh 6h"
    deck = Deck.to_deck unsorted_deck_representation
    #W
    deck_back_representation = deck.to_s
    #T
    assert_equal "ah kh 6h 5h 4h 3h", deck_back_representation
  end

end