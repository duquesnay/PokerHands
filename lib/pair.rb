require_relative 'deck'
require_relative "hand"

class Pair < Hand

  def initialize (paired_cards, kickers = Deck.new)
    @value = paired_cards[0].to_value
    @kickers = kickers
  end

  def resolve_against challenger
    return PairResult.new self if higher_hand_than?(challenger)
    return resolve_against_pair challenger
  end

  def resolve_against_pair challenging_pair
    value_resolution = compare_by_value challenging_pair
    return PairResult.new(self) if value_resolution > 0
    return resolve_by_kickers challenging_pair if value_resolution == 0
  end

  def compare_by_value challenging_pair
    @value <=> challenging_pair.value
  end

  def resolve_by_kickers challenging_pair
    challenging_kickers = challenging_pair.kickers

    my_kicker = @kickers.search_discriminator challenging_kickers

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
  def higher_hand_than?(challenger)
    !challenger.instance_of? Pair
  end

  def no_kicker_to_compare(challenging_kickers)
    !@kickers && !challenging_kickers
  end

end