require_relative "comparator"

class Value
  include Comparable

  ALL_VALUES = "23456789tjqka"
  @sign

  NAMES = {
      "a" => "ace",
      "k" => "king",
      "q" => "queen",
      "j" => "jack",
      "t" => "10",
      "9" => "9",
      "8" => "8",
      "7" => "7",
      "6" => "6",
      "5" => "5",
      "4" => "4",
      "3" => "3",
      "2" => "2"
  }

  def initialize(sign)
    raise "unknown value "+sign if Value::is_sign(sign)
    @sign = sign
  end

  def to_s
    @sign
  end

  def <=> another_value
    SignComparator.compare_objects_by_value self, another_value
  end

  def tell_sign(visitor)
    visitor.gather_value @sign
  end

  def compare_to_v(v)
    self <=> v
  end

  def self.is_sign(value)
    !ALL_VALUES.include? value
  end

  def name_one
    particle = (@sign == 'a' ? 'an' : 'a')
    name = NAMES[@sign]
    "#{particle} #{name}"
  end

  def name_many
    plural = (@sign =~ /j|q|k|a/ ? 's' : '')
    name = NAMES[@sign]
    "#{name}#{plural}"
  end

  class SignComparator < Comparator
    def visit value
      value.tell_sign self
    end
    def compare
      Value::ALL_VALUES.index(left_value) - Value::ALL_VALUES.index(right_value)
    end
  end
end

