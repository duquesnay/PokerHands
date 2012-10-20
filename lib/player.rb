require_relative 'results'

module PlayerNames
  WHITE_NAME = "white"
  BLACK_NAME = "black"
end

class Player
  @name
  @deck

  def initialize(name, deck)
    @name, @deck = name, deck
  end

  def print_name
    @name.to_s
  end

  def challenge challenged_player
    my_hand = search_best_hand
    challenging_hand = challenged_player.search_best_hand
    challenge_result = my_hand.challenge challenging_hand
    return WinnerResult.new( self, challenge_result ) if challenge_result
  end

  protected
  def search_best_hand
    @deck.search_best_hand
  end
end