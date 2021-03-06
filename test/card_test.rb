require "test/unit"
require_relative "../lib/card"
require_relative "../lib/value"

#noinspection RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention,RubyInstanceMethodNamingConvention
class CardTest < Test::Unit::TestCase

  def test_generate_card_from_3H()
    card = Card.to_card("3h")
    assert_match(/3/, card.print_value)
    assert_match(/3h/, card.print)
  end

  def test_fire_if_unknown_value_when_creating_card
    assert_raise RuntimeError do
      Card.to_card('ih')
    end
  end

  def test_accept_known_value_when_creating_card
    assert_nothing_raised do
      Card.to_card('2h')
    end
  end

  def test_fire_if_unknown_color_when_creating_card
    assert_raise RuntimeError do
      Card.to_card('2j')
    end
  end

  def test_card_asc_order_respected()
    #G
    bigger=Value::ALL_VALUES[1..12]
    lower=Value::ALL_VALUES[0..11]

    (0..11).each do |i|
      #G
      big_sign = "#{bigger[i]}h"
      lower_sign = "#{lower[i]}h"
      big_card = Card.to_card(big_sign)
      low_card = Card.to_card(lower_sign)
      #T
      assert big_card.stronger_than?(low_card), "found card #{big_card} < #{low_card}"
    end

  end

  def test_card_desc_order_respected()
    #G
    bigger=Value::ALL_VALUES[1..12]
    lower=Value::ALL_VALUES[0..11]

    (0..11).each do |i|
      #G
      big_sign = bigger[i]+'h'
      lower_sign = lower[i]+'h'
      big_card = Card.to_card(big_sign)
      low_card = Card.to_card(lower_sign)
      #T
      assert low_card.compare_strength(big_card), "found card #{low_card} > #{big_card}"
    end

  end

  def test_different_color_same_value_gives_equality()
    #G
    left_card = Card.to_card("3h")
    right_card = Card.to_card("3s")
    assert(!left_card.stronger_than?(right_card), "found card #{left_card} W #{right_card}")
    assert(!right_card.stronger_than?(left_card), "found card #{right_card} > #{left_card}")
    #T
    assert(right_card.same_value?(left_card), "found card #{right_card} != #{left_card}")
  end


end