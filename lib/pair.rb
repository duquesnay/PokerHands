require_relative 'deck'

class Pair

  def initialize (value, kickers = Deck.new)
    @value = value
    @kickers = kickers
  end

  def resolve_against (challenger)
    return generate_win if not_a_pair?(challenger)
    resolve_against_pair challenger
  end

  def weakier_than?( value )
    @value < value
  end

  def as_strong_as?( value )
    @value == value
  end

  def print
    "a pair of #{@value.print_as_plural}"
  end

  private
  def resolve_against_pair (challenging_pair)
    return generate_win if challenging_pair.weakier_than?( @value )
    resolve_by_kickers challenging_pair if challenging_pair.as_strong_as?( @value )
  end

  def resolve_by_kickers (challenging_pair)
    my_kicker = challenging_pair.search_kicker_of @kickers
    KickerResolution.from_card(my_kicker) if my_kicker
  end

  def search_kicker_of( challenging_kickers )
    challenging_kickers.search_discriminator @kickers
  end

  def generate_win
    PairResolution.from_pair self
  end

  def not_a_pair?(challenger)
    !challenger.instance_of? Pair
  end

end