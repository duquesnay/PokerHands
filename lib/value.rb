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
      TEN_SYMBOL => "10",
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
    raise "unknown value "+sign if Value.is_sign(sign)
    @sign = sign
  end

  def to_s
    @sign.to_s
  end

  def <=> (another_value)
    another_value.compare_rank_to_me value_rank()
  end

  def compare_rank_to_me(another_rank)
    another_rank - value_rank()
  end

  def value_rank
    ALL_VALUES.index(@sign)
  end

  def compare_to_v(v)
    self <=> v
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

  def self.is_sign(value)
    !ALL_VALUES.include? value
  end

end


