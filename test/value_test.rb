require "test/unit"
require_relative "../lib/value"

class ValueTest  < Test::Unit::TestCase

  def test_3_bigger_than_4
    low_value = (Value.new "3")
    big_value = (Value.new "4")
    order = low_value < big_value
    assert order, "found value #{low_value} >= #{big_value}"
  end

  def test_value_reverse_order_respected()
      #G
      bigger=Value::ALL_VALUES[1..12]
      lower=Value::ALL_VALUES[0..11]

      (1..11).each do |i|
        #G
        big_sign = bigger[i]
        lower_sign = lower[i]
        big_value = Value.new(big_sign)
        low_value = Value.new(lower_sign)
        #T
        order = low_value < big_value
        assert(order, "found value #{low_value} >= #{big_value}")
      end

  end
end