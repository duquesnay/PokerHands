require "test/unit"
require "./game"

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

  #def test_raise_when_white_separator_missing
  #  white="hkh2 h3 h4 h5"
  #  black="hk h2 h3 h4 h5"
  #  game = Game.new
  #
  #  assert_raise RuntimeError do
  #    game.fight white, black
  #  end
  #end

  #def test_raise_when_black_separator_missing
  #  white="hk h2 h3 h4 h5"
  #  black="hkh2 h3 h4 h5"
  #  game = Game.new
  #
  #  assert_raise RuntimeError do
  #    game.fight white, black
  #  end
  #end

  def test_white_wins_when_1_card_hand_is_ace_against_king()
    #G
    white="ah"
    black="ks"
    game = Game.new

    #W
    answer = game.fight white, black
    #T
    #T
    assert_match( /white wins/, answer);
  end

  def test_white_wins_when_one_card_hand_is_king_against_queen()
    #G
    white="kh 2h 3h 8h 9h"
    black="qs 2s 3s 8s 9s"
    game = Game.new

    #W
    answer = game.fight white, black
    #T
    #T
    assert_match( /white wins/, answer);
  end

  def test_black_wins_when_first_black_card_bigger()
    #G
    white="kh"
    black="as"
    game = Game.new

    #W
    answer = game.fight white, black
    #T
    assert_match(/^black wins/, answer);

  end

  def test_white_card_wins_on_two_cards_when_second_card_bigger
    #G
    white="kh ah"
    black="ks 2s"
    game = Game.new

    #W
    answer = game.fight white, black
    #T
    #T
    assert_match(/^white wins/, answer);
  end

  def test_black_card_wins_on_two_cards_when_second_card_bigger
    #G
    white="kh ah"
    black="ks 2s"
    game = Game.new

    #W
    answer = game.fight white, black
    #T
    #T
    assert_match(/^white wins/, answer);
  end

  def test_white_card_wins_on_three_cards_when_second_card_bigger
    #G
    white="kh ah 3s"
    black="ks 2s 4h"
    game = Game.new

    #W
    answer = game.fight white, black
    #T
    #T
    assert_match(/^white wins/, answer);
  end

  def test_white_card_wins_on_five_cards_when_second_card_bigger
    #G
    white="kh ah 3s 2d 5s"
    black="ks 2s 4h 3h 5h"
    game = Game.new

    #W
    answer = game.fight white, black
    #T
    #T
    assert_match(/^white wins/, answer);
  end

  def test_white_card_wins_on_second_card
    #G
    white="kh qh"
    black="ks 2s"
    game = Game.new

    #W
    answer = game.fight white, black
    #T
    #T
    assert_match(/^white wins/, answer);
  end

  def test_black_card_wins_on_any_card_bigger
    #G
    white="kh 2s 5h qh"
    black="as qs 4h ks "
    game = Game.new

    #W
    answer = game.fight white, black
    #T
    #T
    assert_match(/^black wins/, answer);
  end

  def test_claim_winner_card_on_bigger_card
    #G
    white="kh ah 3s 2d 5s"
    black="ks 2s 4h 3h 5h"
    game = Game.new

    #W
    answer = game.fight white, black
    #T
    #T
    assert_match(/^white wins - with higher card : an ace$/, answer);
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