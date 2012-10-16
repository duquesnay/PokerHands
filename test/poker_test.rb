require "test/unit"
require_relative "../lib/game"

class PokerTest < Test::Unit::TestCase

  def setup
  end

  def teardown
  end

  def test_detect_one_card_hand_equality()
    #G
    white="kh"
    black="ks"
    game = Game.new

    #W
    answer = game.fight white, black
    #T
    #T
    assert_equal("hand matches - equality", answer);
  end

  def test_raise_when_white_separator_missing
    white="hkh2 h3 h4 h5"
    black="hk h2 h3 h4 h5"
    game = Game.new

    assert_raise RuntimeError do
      game.fight white, black
    end
  end

  def test_raise_when_black_separator_missing
    white="hk h2 h3 h4 h5"
    black="hkh2 h3 h4 h5"
    game = Game.new

    assert_raise RuntimeError do
      game.fight white, black
    end
  end

  def test_one_white_pair_beats_higher_card
    #G
    white="2h 2s 3h 4h 5h"
    black="as qs 4s kd jd"
    game = Game.new

    #W
    answer = game.fight white, black
    #T
    assert_match(/^white wins/, answer);

  end
  #
  def test_one_black_pair_beats_higher_card
    #G
    white="as qs 4s kd jd"
    black="2h 2s 3h 4h 5h"
    game = Game.new

    #W
    answer = game.fight white, black
    #T
    #T
    assert_match(/^black wins/, answer);

  end

  def test_biggest_single_pair_should_win
    #G
    pair_of_4_kicker_ace="3s 4s 4s ad jd" #higher card here : ace
    pair_of_five_kicker_king="2h 5s 3h 5h kh" #pair_of_five
    game = Game.new
                                               #higher card here
    #W
    answer = game.fight pair_of_4_kicker_ace, pair_of_five_kicker_king
    #T
    #T
    assert_match(/^black wins/, answer);
  end

  def test_claim_winner_pair_on_white_card
    #G
    white="kh ah 4s 4d 5s"
    black="ks 2s 4h 3h 5h"
    game = Game.new

    #W
    answer = game.fight white, black
    #T
    #T
    assert_match(/^white wins - with a pair of 4$/, answer);
  end

  def test_claim_winner_pair_on_black_card
    #G
    white="ks 2s 4h 3h 5h"
    black="kh 2h 4s 4d 5s"
    game = Game.new

    #W
    answer = game.fight white, black
    #T
    #T
    assert_match(/^black wins - with a pair of 4$/, answer);
  end

end