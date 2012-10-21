require "test/unit"
require_relative '../lib/game'

#noinspection RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention
class HighCardResolutionTest < Test::Unit::TestCase

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
    assert_match( /white wins/, answer)
  end

  def test_white_wins_when_one_card_deck_is_king_against_queen()
    #G
    white="kh 2h 3h 8h 9h"
    black="qs 2s 3s 8s 9s"

    #W
    answer = @game.challenge white, black
    #T
    #T
    assert_match( /white wins/, answer)
  end

  def test_high_card_print_properly
    #G
    white="kh ah 3s 2d 5s"
    black="ks 2s 4h 3h 5h"
    game = Game.new

    #W
    answer = game.challenge white, black
    #T
    #T
    assert_match(/^white wins - with high card : an ace$/, answer)
  end
end