require "test/unit"
require_relative '../lib/game'

class HighCardResolutionTest #< Test::Unit::TestCase

  def setup
    @game = Game.new
  end

  def test_white_wins_when_1_card_deck_is_ace_against_king()
    #G
    white=  "ah"
    black=  "ks"

    #W
    answer = @game.challenge white, black

    #T
    assert_match( /white wins/, answer);
  end

  def _test_white_wins_when_one_card_deck_is_king_against_queen()
    #G
    white="kh 2h 3h 8h 9h"
    black="qs 2s 3s 8s 9s"

    #W
    answer = @game.challenge white, black
    #T
    #T
    assert_match( /white wins/, answer);
  end

  def _test_black_wins_when_first_black_card_bigger()
    #G
    white="kh"
    black="as"
    game = Game.new

    #W
    answer = game.challenge white, black
    #T
    assert_match(/^black wins/, answer);

  end

  def _test_white_card_wins_on_two_cards_when_second_card_bigger
    #G
    white="kh ah"
    black="ks 2s"
    game = Game.new

    #W
    answer = game.challenge white, black
    #T
    #T
    assert_match(/^white wins/, answer);
  end

  def _test_black_card_wins_on_two_cards_when_second_card_bigger
    #G
    white="kh 2s"
    black="ks ah"
    game = Game.new

    #W
    answer = game.challenge white, black
    #T
    #T
    assert_match(/^black wins/, answer);
  end

  def _test_white_card_wins_on_three_cards_when_second_card_bigger
    #G
    white="kh ah 3s"
    black="ks 2s 4h"
    game = Game.new

    #W
    answer = game.challenge white, black
    #T
    #T
    assert_match(/^white wins/, answer);
  end

  def _test_white_card_wins_on_five_cards_when_second_card_bigger
    #G
    white="kh ah 3s 2d 5s"
    black="ks 2s 4h 3h 5h"
    game = Game.new

    #W
    answer = game.challenge white, black
    #T
    #T
    assert_match(/^white wins/, answer);
  end

  def _test_white_card_wins_on_second_card
    #G
    white="kh qh"
    black="ks 2s"
    game = Game.new

    #W
    answer = game.challenge white, black
    #T
    #T
    assert_match(/^white wins/, answer);
  end

  def _test_black_card_wins_on_any_card_bigger
    #G
    white="kh 2s 5h qh"
    black="as qs 4h ks "
    game = Game.new

    #W
    answer = game.challenge white, black
    #T
    #T
    assert_match(/^black wins/, answer);
  end

  def _test_claim_winner_card_on_bigger_card
    #G
    white="kh ah 3s 2d 5s"
    black="ks 2s 4h 3h 5h"
    game = Game.new

    #W
    answer = game.challenge white, black
    #T
    #T
    assert_match(/^white wins - with higher card : an ace$/, answer);
  end
end