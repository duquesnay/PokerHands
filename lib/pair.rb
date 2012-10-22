require_relative 'deck'

class Pair

  def initialize (paired_cards, kickers = Deck.new)
    @value = paired_cards[0].to_value
    @kickers = kickers
  end

  def resolve_against (challenger)
    return to_winning_resolution if not_a_pair?(challenger)

    resolve_against_pair challenger
  end

  def to_winning_resolution
    PairResolution.from_pair self
  end

  EQUALITY_COMPARISON = 0

  def resolve_against_pair (challenging_pair)
    value_resolution = challenging_pair.compare_value_to_me(@value)
    return to_winning_resolution if means_bigger(value_resolution)
    resolve_by_kickers challenging_pair if means_equality(value_resolution)
  end

  def means_bigger(value_resolution)
    value_resolution > 0
  end

  def means_equality(value_resolution)
    value_resolution == EQUALITY_COMPARISON
  end

  def compare_value_to_me (challenging_value)
    challenging_value <=> @value
  end

  def resolve_by_kickers (challenging_pair)
    challenging_kickers = challenging_pair.kickers

    my_kicker = @kickers.search_discriminator challenging_kickers

    KickerResolution.from_card(my_kicker) if my_kicker
  end

  def print
    "a pair of #{@value.print_as_plural}"
  end

  protected

  def kickers
    @kickers
  end

  private
  def not_a_pair?(challenger)
    !challenger.instance_of? Pair
  end

end