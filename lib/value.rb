class Value
  include Comparable

  ALL_VALUES = "23456789tjqka"
  @sign

  ACE_SYMBOL = "a"
  KING_SYMBOL = "k"
  QUEEN_SYMBOL = "q"
  JACK_SYMBOL = "j"
  TEN_SYMBOL = "t"
  NAMES = {
      ACE_SYMBOL => "ace",
      KING_SYMBOL => "king",
      QUEEN_SYMBOL => "queen",
      JACK_SYMBOL => "jack",
      "10" => "10",
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

  def <=> (another_value)
    Value::ALL_VALUES.index(sign) - Value::ALL_VALUES.index(another_value.sign)
  end

  def compare_to_v(v)
    self <=> v
  end

  def self.is_sign(value)
    !ALL_VALUES.include? value
  end

  def print_as_singular
    particle = (@sign == 'a' ? 'an' : 'a')
    name = NAMES[@sign]
    "#{particle} #{name}"
  end

  def print_as_plural
    plural = (@sign =~ /j|q|k|a/ ? 's' : '')
    name = NAMES[@sign]
    "#{name}#{plural}"
  end

  protected
  def sign
    @sign
  end
end


