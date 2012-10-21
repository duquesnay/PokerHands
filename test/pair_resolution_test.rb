require "test/unit"
require_relative "../lib/deck"
require_relative "../lib/game"

#noinspection RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention
class PairResolutionTest < Test::Unit::TestCase

  def setup
  end

  def test_pair_resolution_exist_when_pair_bigger
    #G
    big_cards = Deck.to_deck "4s 4d"
    low_cards = Deck.to_deck "3s 3h"

    pair_of_4 = Pair.new big_cards
    pair_of_3 = Pair.new low_cards
    #W
    result = pair_of_4.resolve_against_pair pair_of_3

    #T
    assert_not_nil result
  end

  def test_compare_pairs_tell_pair_value
    big_cards = Deck.to_deck "4s 4d"
    low_cards = Deck.to_deck "3s 3h"

    pair_of_4 = Pair.new big_cards
    pair_of_3 = Pair.new low_cards
    #W
    result = pair_of_4.resolve_against_pair pair_of_3

    #T
    assert_match /4/, result.print_resolution
  end

  def test_tell_pair_value_as_plural_when_needed
    big_cards = Deck.to_deck "ks kd"
    low_cards = Deck.to_deck "3s 3h"

    pair_of_4 = Pair.new big_cards
    pair_of_3 = Pair.new low_cards
    #W
    result = pair_of_4.resolve_against_pair pair_of_3

    #T
    assert_match /pair of kings$/, result.print_resolution
  end

  def test_no_resolution_when_pair_lower
    #G
    big_cards = Deck.to_deck "4s 4d"
    low_cards = Deck.to_deck "3s 3h"

    pair_of_4 = Pair.new big_cards
    pair_of_3 = Pair.new low_cards
    #W
    result = pair_of_3.resolve_against_pair pair_of_4

    #T
    assert_nil result
  end

  def test_no_resolution_when_pair_equal
    #G
    pair_deck = Deck.to_deck "4s 4d"
    pair_of_4 = Pair.new pair_deck
    #W
    result = pair_of_4.resolve_against_pair pair_of_4

    #T
    assert_nil result
  end


  def test_no_resolution_when_lower_kicker_and_pair_equality
    #G
    pair_cards = Deck.to_deck "4s 4d"
    bigger_kicker = Deck.to_deck "kh"
    lower_kicker = Deck.to_deck "qs"

    hand_of_big_kicker = Pair.new pair_cards, bigger_kicker
    hand_of_lower_kicker = Pair.new pair_cards, lower_kicker
    #W
    result = hand_of_lower_kicker.resolve_against_pair hand_of_big_kicker

    #T
    assert_nil result
  end

  def test_no_resolution_when_same_kicker_same_pair
    #G
    pair = Deck.to_deck "4s 4d"
    kicker = Deck.to_deck "kh"

    a_hand = Pair.new pair, kicker
    same_hand = Pair.new pair, kicker
    #W
    result = a_hand.resolve_against_pair same_hand

    #T
    assert_nil result
  end

  def test_resolve_by_big_kicker_when_pair_equality
    #G
    pair_cards = Deck.to_deck "4s 4d"
    bigger_kicker = Deck.to_deck "kh"
    lower_kicker = Deck.to_deck "qs"

    hand_of_big_kicker = Pair.new pair_cards, bigger_kicker
    hand_of_lower_kicker = Pair.new pair_cards, lower_kicker
    #W
    result = hand_of_big_kicker.resolve_against_pair hand_of_lower_kicker

    #T
    assert result
  end

  def test_resolve_by_big_kicker_tells_it_properly
    #G
    pair_cards = Deck.to_deck "4s 4d"
    bigger_kicker = Deck.to_deck "kh"
    lower_kicker = Deck.to_deck "qs"

    hand_of_big_kicker = Pair.new pair_cards, bigger_kicker
    hand_of_lower_kicker = Pair.new pair_cards, lower_kicker
    #W
    result = hand_of_big_kicker.resolve_against_pair hand_of_lower_kicker

    #T
    assert_match /^by kicker as a king$/, result.print_resolution
  end



end