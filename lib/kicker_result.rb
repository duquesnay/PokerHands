class KickerResult
  @hand_result

  def initialize(hand_result)
    @hand_result = hand_result
  end

  def print_result
    @hand_result.print_result
  end
end