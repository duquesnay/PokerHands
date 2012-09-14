class HandsPairComparator < Comparator

  def visit hand
    hand.tell_first_pair self
  end

  def compare
    if left_value && left_value > right_value
      return PairResult.new(HandsComparator::WHITE_NAME, left_value)
    end
    if right_value && right_value > left_value
      return PairResult.new(HandsComparator::BLACK_NAME, right_value)
    end
    return
  end
end