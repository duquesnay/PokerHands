require_relative 'card'
require_relative 'hand'
require_relative 'results'

class Game

  def fight(white_hand_representation, black_hand_representation)

    white_hand = Hand.to_hand white_hand_representation
    black_hand = Hand.to_hand black_hand_representation

    result = white_hand.compare( black_hand )
    result.print_result
  end

end
