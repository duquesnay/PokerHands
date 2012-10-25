require_relative 'card'
require_relative 'deck'
require_relative 'results'
require_relative 'player'

class Game
  include PlayerNames

  EQUALITY_RESULT = EqualityResult.new

  def challenge(left_deck_input, right_deck_input)

    register_white_from(left_deck_input)
    register_black_from(right_deck_input)
    result = resolve_game()
    result.print_result
  end

  def resolve_game
    winning_resolution = search_winner_resolution()
    winning_resolution || EQUALITY_RESULT
  end

  def search_winner_resolution
    white_challenge_black || black_challenge_white
  end

  def white_challenge_black
    @white.challenge(@black)
  end

  def black_challenge_white
    @black.challenge(@white)
  end

  def register_black_from(deck_representation)
    player_deck = DeckInterpreter.to_deck deck_representation
    @black = Player.new BLACK_NAME, player_deck
  end

  def register_white_from(deck_representation)
    player_deck = DeckInterpreter.to_deck deck_representation
    @white = Player.new WHITE_NAME, player_deck
  end

end
