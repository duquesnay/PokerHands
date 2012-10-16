require_relative "gamers"
require_relative "high_card"
require_relative "comparator"
require_relative "results"

class HandsPairComparator < Comparator
  include Gamers

  class PairComparator < Comparator
    def visit hand
      hand.tell_first_pair self
    end

    def compare
      if left_value && left_value > right_value
        return PairResult.new(WHITE_NAME, left_value)
      end
      if right_value && right_value > left_value
        return PairResult.new(BLACK_NAME, right_value)
      end
      return EqualityResult.new
    end

  end

  def visit hand
    hand.tell_first_pair self
  end

  def compare
    if left_value && left_value > right_value
      return PairResult.new(WHITE_NAME, left_value)
    end
    if right_value && right_value > left_value
      return PairResult.new(BLACK_NAME, right_value)
    end
    #comparator = HighCard.new
    #comparator.visit left_value
    #comparator.visit right_value
    #number_of_cards = left_value.length-1
    #(0..number_of_cards).each do |n|
    #  white_card, black_card = left_value[n], right_value[n]
    #  return PairResult.new(WHITE_NAME, left_value) if white_card.stronger_than black_card
    #  #return PairResult.new(BLACK_NAME, right_value) if black_card.stronger_than white_card
    #end
    return EqualityResult.new
  end
end