class EqualityResult

  HAND_MATCHES_RESULT_MESSAGE = "deck matches - equality"

  def print_result
    HAND_MATCHES_RESULT_MESSAGE
  end

end

class WinnerResult
  def initialize (winner, resolution)
    @winner, @resolution = winner, resolution
  end

  def print_result
    resolution_message = @resolution.print_resolution
    winner_name= @winner.print_name
    "#{winner_name} wins - #{resolution_message}"
  end
end

class PairResolution
  @pair

  def self.from_pair (winner_pair)
    PairResolution.new winner_pair
  end

  def print_pair
    @pair.print
  end

  def print_resolution
    "with #{print_pair}"
  end

  private
  def initialize (winner_pair)
    @pair = winner_pair
  end
end

class KickerResolution
  @kicker

  def self.from_card(kicker_card)
    KickerResolution.new kicker_card
  end

  def print_kicker
    @kicker.print_value
  end

  def print_resolution
    "by kicker as #{print_kicker}"
  end

  private
  def initialize (kicker_card)
    @kicker = kicker_card
  end

end

class HighCardResolution
  @high_card

  def self.from_card( winning_card )
    HighCardResolution.new winning_card
  end

  def print_high_card
    @high_card.print_value
  end

  def print_resolution
    "with high card : #{print_high_card}"
  end

  private
  def initialize (winning_card)
    @high_card = winning_card
  end
end