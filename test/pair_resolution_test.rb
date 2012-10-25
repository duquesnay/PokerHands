require "test/unit"
require_relative "../lib/deck"
require_relative "../lib/game"

class Pair
  public :resolve_against_pair, :search_kicker_of
end

#noinspection RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention
class PairResolutionTest < Test::Unit::TestCase

  def setup
  end

  VALUE_4 = Value.new "4"
  VALUE_3 = Value.new "3"

  def test_pair_resolution_exist_when_pair_bigger
    #G
    pair_of_4 = Pair.new VALUE_4
    pair_of_3 = Pair.new VALUE_3
    #W
    result = pair_of_4.resolve_against_pair pair_of_3

    #T
    assert_not_nil result
  end

  def test_compare_pairs_tell_pair_value
    pair_of_4 = Pair.new VALUE_4
    pair_of_3 = Pair.new VALUE_3
    #W
    result = pair_of_4.resolve_against_pair pair_of_3

    #T
    assert_match /4/, result.print_resolution
  end

  VALUE_KING = Value.new "k"

  def test_tell_pair_value_as_plural_when_needed
    pair_of_king = Pair.new VALUE_KING
    pair_of_3 = Pair.new VALUE_3
    #W
    result = pair_of_king.resolve_against_pair pair_of_3

    #T
    assert_match /pair of kings$/, result.print_resolution
  end

  def test_no_resolution_when_pair_lower
    #G
    pair_of_4 = Pair.new VALUE_4
    pair_of_3 = Pair.new VALUE_3
    #W
    result = pair_of_3.resolve_against_pair pair_of_4

    #T
    assert_nil result
  end

  def test_no_resolution_when_pair_equal
    #G
    pair_of_4 = Pair.new VALUE_4
    #W
    result = pair_of_4.resolve_against_pair pair_of_4

    #T
    assert_nil result
  end


  def test_no_resolution_when_lower_kicker_and_pair_equality
    #G
    pair_value = VALUE_4
    bigger_kicker = DeckInterpreter.to_deck "kh"
    lower_kicker = DeckInterpreter.to_deck "qs"

    hand_of_big_kicker = Pair.new pair_value, bigger_kicker
    hand_of_lower_kicker = Pair.new pair_value, lower_kicker
    #W
    result = hand_of_lower_kicker.resolve_against_pair hand_of_big_kicker

    #T
    assert_nil result
  end

  def test_no_resolution_when_same_kicker_same_pair
    #G
    pair = VALUE_4
    kicker = DeckInterpreter.to_deck "kh"

    a_hand = Pair.new pair, kicker
    same_hand = Pair.new pair, kicker
    #W
    result = a_hand.resolve_against_pair same_hand

    #T
    assert_nil result
  end

  def test_resolve_by_big_kicker_when_pair_equality
    #G
    pair_value = VALUE_4
    bigger_kicker = DeckInterpreter.to_deck "kh"
    lower_kicker = DeckInterpreter.to_deck "qs"

    hand_of_big_kicker = Pair.new pair_value, bigger_kicker
    hand_of_lower_kicker = Pair.new pair_value, lower_kicker
    #W
    result = hand_of_big_kicker.resolve_against_pair hand_of_lower_kicker

    #T
    assert result
  end

  def test_resolve_by_big_kicker_tells_it_properly
    #G
    pair_value = VALUE_4
    bigger_kicker = DeckInterpreter.to_deck "kh"
    lower_kicker = DeckInterpreter.to_deck "qs"

    hand_of_big_kicker = Pair.new pair_value, bigger_kicker
    hand_of_lower_kicker = Pair.new pair_value, lower_kicker
    #W
    result = hand_of_big_kicker.resolve_against_pair hand_of_lower_kicker

    #T
    assert_match /^by kicker as a king$/, result.print_resolution
  end

end