class EqualityResult

  HAND_MATCHES_RESULT_MESSAGE = "hand matches - equality"

  def print_result
    return HAND_MATCHES_RESULT_MESSAGE
  end

end

class WinnerResult
  def initialize name
    @winner_name = name
  end
  def print_result
    "#{@winner_name} wins"
  end
end

class HigherCardResult < WinnerResult

  def initialize(hand_owner_name, decisive_card)
    super hand_owner_name
    @decisive_card = decisive_card
  end

  def print_result
    super+" - with higher card : #{@decisive_card.print_value}"
  end

end

class PairResult < WinnerResult
  @pair
  def initialize winner_name, pair
    super winner_name
    @pair = pair
  end
  def print_pair
    @pair.print
  end
  def print_result
    super+" - with #{print_pair}"
  end
end