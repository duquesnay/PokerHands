require_relative 'card'
require_relative 'deck'
require_relative 'results'
require_relative 'player'

class Game
  include PlayerNames

  def challenge(white_deck_representation, black_deck_representation)

    white_deck = Deck.to_deck white_deck_representation
    black_deck = Deck.to_deck black_deck_representation


    white = Player.new WHITE_NAME, white_deck
    black = Player.new BLACK_NAME, black_deck
    result = white.challenge(black) || black.challenge(white) || EqualityResult.new
    result.print_result
  end

end
