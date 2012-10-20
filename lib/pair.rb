require_relative 'deck'

class Pair

  def initialize (paired_cards, kickers = Deck.new)
    @value = paired_cards[0].to_value
    @kickers = kickers
  end

  #def <=> another_pair
  #  return 1 if !another_pair
  #  return 1 if !another_pair.is_a? Pair
  #  return -another_pair.compare_to_value(@value)
  #end

  def challenge challenger
    return PairResult.new self if higher_hand_type(challenger)
    return resolve_against challenger
  end

  def resolve_against challenging_pair
    value_resolution = compare_by_value challenging_pair
    return PairResult.new(self) if value_resolution > 0
    return resolve_by_kickers challenging_pair if value_resolution == 0
  end

  def compare_by_value challenging_pair
    @value <=> challenging_pair.value
  end

  def resolve_by_kickers challenging_pair
    challenging_kickers = challenging_pair.kickers

    my_kicker = @kickers.discriminating_card_against? challenging_kickers

    return KickerResolution.new(my_kicker) if my_kicker
  end

  def compare_to_value value
    self.value <=> value
  end

  def print
    "a pair of #{@value}"
  end

  protected
  def value
    @value
  end

  def kickers
    @kickers
  end

  private
  def higher_hand_type(challenger)
    !challenger.instance_of? Pair
  end

  def no_kicker_to_compare(challenging_kickers)
    !@kickers && !challenging_kickers
  end

end