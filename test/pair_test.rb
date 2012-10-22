require "test/unit"
require_relative "../lib/pair"
require_relative "../lib/deck"

class PairTest < Test::Unit::TestCase

  def test_greater_than_value
    #G
    white_pair = Pair.new ([(Card.to_card "4s"), (Card.to_card "4d")])
    black_value = Value.new "2"# Pair.new ([(Card.to_card "2s"), (Card.to_card "2d")])

    #W
    result = white_pair.compare_value_to_me black_value

    #T
    assert result < 0
  end

  def test_lower_than_value
    #G
    white_pair = Pair.new ([(Card.to_card "2s"), (Card.to_card "2d")])
    black_value = Value.new "4"

    #W
    result = white_pair.compare_value_to_me black_value

    #T
    assert result > 0
  end

end