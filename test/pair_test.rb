require "test/unit"
require_relative "../lib/pair"
require_relative "../lib/deck"

class PairTest < Test::Unit::TestCase

  VALUE_2 = Value.new "2"
  VALUE_4 = Value.new "4"

  PAIR_OF_2 = Pair.new VALUE_2 #([(Card.to_card "2s"), (Card.to_card "2d")])
  PAIR_OF_4 = Pair.new VALUE_4 #([(Card.to_card "4s"), (Card.to_card "4d")])

  def test_not_same_value_as
    #G
    white_pair = PAIR_OF_4
    black_value = VALUE_2

    #W
    result = white_pair.as_strong_as? black_value

    #T
    assert_false result
  end

  def test_same_value_as
    #G
    white_pair = PAIR_OF_4
    black_value = VALUE_4

    #W
    result = white_pair.as_strong_as? black_value

    #T
    assert result
  end

  def test_weakier_than_value
    #G
    white_pair = PAIR_OF_2
    black_value = VALUE_4

    #W
    result = white_pair.weakier_than? black_value

    #T
    assert result
  end

  def test_not_lower_than_value
    #G
    white_pair = PAIR_OF_2
    black_value = VALUE_2

    #W
    result = white_pair.weakier_than? black_value

    #T
    assert_false result
  end

end