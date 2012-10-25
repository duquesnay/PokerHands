require "test/unit"
require_relative '../lib/deck'

#noinspection RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention
class DiscriminatingCardTest < Test::Unit::TestCase


  def test_find_kicker_when_first
    # G
    white_deck = DeckInterpreter.to_deck "qs"
    black_deck = DeckInterpreter.to_deck "5h"

    #W
    result = white_deck.search_discriminator black_deck

    #T
    assert result
  end

  def test_find_proper_kicker_when_first
    # G
    white_deck = DeckInterpreter.to_deck "qs"
    black_deck = DeckInterpreter.to_deck "5h"

    #W
    result = white_deck.search_discriminator black_deck

    #T
    assert_equal "qs", result.to_s
  end

  def test_find_proper_kicker_when_second
    # G
    white_deck = DeckInterpreter.to_deck "kh qs"
    black_deck = DeckInterpreter.to_deck "ks 5h"

    #W
    result = white_deck.search_discriminator black_deck

    #T
    assert_equal "qs", result.to_s
  end

end