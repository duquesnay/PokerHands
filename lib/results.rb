class EqualityResult

  HAND_MATCHES_RESULT_MESSAGE = "deck matches - equality"

  def print_result
    return HAND_MATCHES_RESULT_MESSAGE
  end

end

class WinnerResult
  def initialize winner, resolution
    @winner, @resolution = winner, resolution
  end

  def print_result
    resolution_message = @resolution.print_resolution
    winner_name= @winner.print_name
    "#{winner_name} wins - #{resolution_message}"
  end
end

class PairResult
  @pair

  def initialize winner_pair
    @pair = winner_pair
  end

  def print_pair
    @pair.print
  end

  def print_resolution
    "with #{print_pair}"
  end
end

class KickerResolution
  @kicker

  def initialize kicker_card
    @kicker = kicker_card
  end

  def print_kicker
    @kicker.print
  end

  def print_resolution
    "by kicker as #{print_kicker}"
  end

end

class HighCardResolution
  @high_card

  def initialize kicker_card
    @kicker = kicker_card
  end

  def print_high_card
    @kicker.print_value
  end

  def print_resolution
    "with high card : #{print_high_card}"
  end
end