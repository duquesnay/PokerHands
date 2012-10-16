require_relative "gamers"
require_relative "results"
require_relative "comparator"

class HighCard < Comparator
  include Gamers

  def visit hand
    hand.tell_higher_cards self
  end

  def compare
    number_of_cards = left_value.length-1
    (0..number_of_cards).each do |n|
      white_card, black_card = left_value[n], right_value[n]
      return HigherCardResult.new(WHITE_NAME, white_card) if white_card.stronger_than black_card
      return HigherCardResult.new(BLACK_NAME, black_card) if black_card.stronger_than white_card
    end
    return EqualityResult.new
  end
end