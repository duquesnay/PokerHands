require "test/unit"
require_relative '../lib/deck'

class DiscriminatingCardTest < Test::Unit::TestCase


  def test_find_kicker_when_first
    # G
    white_deck = Deck.to_deck("qs")
    black_deck = Deck.to_deck("5h")

    #W
    result = white_deck.discriminating_card_against? black_deck

    #T
    assert result
  end

  def test_find_proper_kicker_when_first
    # G
    white_deck = Deck.to_deck("qs")
    black_deck = Deck.to_deck("5h")

    #W
    result = white_deck.discriminating_card_against? black_deck

    #T
    assert_equal "qs", result.to_s
  end

  def test_find_proper_kicker_when_second
    # G
    white_deck = Deck.to_deck("kh qs")
    black_deck = Deck.to_deck("ks 5h")

    #W
    result = white_deck.discriminating_card_against? black_deck

    #T
    assert_equal "qs", result.to_s
  end

end