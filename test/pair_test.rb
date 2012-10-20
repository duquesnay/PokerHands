require "test/unit"
require_relative "../lib/pair"
require_relative "../lib/deck"

class PairTest < Test::Unit::TestCase

  def test_superior_by_value
    #G
    white_pair = Pair.new ([(Card.to_card "4s"), (Card.to_card "4d")])
    black_pair = Pair.new ([(Card.to_card "2s"), (Card.to_card "2d")])

    #W
    result = white_pair.compare_by_value black_pair

    #T
    assert result > 0;
  end

  def test_lower_by_value
    #G
    black_pair = Pair.new ([(Card.to_card "4s"), (Card.to_card "4d")])
    white_pair = Pair.new ([(Card.to_card "2s"), (Card.to_card "2d")])

    #W
    result = white_pair.compare_by_value black_pair

    #T
    assert result < 0;
  end

end