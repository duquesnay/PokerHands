require "test/unit"
require_relative "../lib/game"

class PokerTest < Test::Unit::TestCase

  def setup
    @game = Game.new
  end

  def test_raise_when_white_separator_missing
    white="hkh2 h3 h4 h5"
    black="hk h2 h3 h4 h5"
    assert_raise RuntimeError do
      @game.challenge white, black
    end
  end

  def test_raise_when_black_separator_missing
    white="hk h2 h3 h4 h5"
    black="hkh2 h3 h4 h5"

    assert_raise RuntimeError do
      @game.challenge white, black
    end
  end

  def _test_should_name_white_winner_when_first_wins
    #G
    pair_of_4_string="kh 2h 4s 4d 5s"
    pair_of_3_string="ks 2s 3h 3h 5h"

    #W
    result = @game.challenge pair_of_4_string, pair_of_3_string

    #T
    assert_match /^white/, result
  end

  def _test_should_name_black_winner_when_second_wins
    #G
    pair_of_3_king_string="ks 2s 3h 3h 5h"
    pair_of_4_string="kh 2h 4s 4d 5s"

    #W
    result = @game.challenge pair_of_3_king_string, pair_of_4_string

    #T
    assert_match /^black/, result
  end

  def test_should_declare_equality_when_no_one_bigger
    #G
    pair_of_4_string="kh 2h 4s 4d 5s"
    high_card_king_string="ks 4s 2h 4h 5h"

    #W
    result = @game.challenge high_card_king_string, pair_of_4_string

    #T
    assert_match /equality/, result
  end

  def _test_on_high_card_when_no_pair_white_wins
    #G
    big_high_card_hand="ks 3s 2h 4h 5h"
    low_high_card_hand= "qs 3s 2h 4h 5h"

    #W
    answer = @game.challenge big_high_card_hand, low_high_card_hand

    #T
    assert_match( /white wins/, answer);
  end

  def _test_on_higher_card_when_no_pair_black_wins
    #G
    big_high_card_hand="ks 3s 2h 4h 5h"
    low_high_card_hand= "qs 3s 2h 4h 5h"

    #W
    answer = @game.challenge low_high_card_hand, big_high_card_hand

    #T
    assert_match( /black wins/, answer);
  end
end