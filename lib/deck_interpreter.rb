require_relative 'deck'

class DeckInterpreter

  def self.to_deck(deck_representation)
    symbols = deck_representation.split(' ')

    cards = symbols.collect { |symbol_card|
      to_card(symbol_card)
    }
    Deck.new cards
  end

  def self.to_card(symbol_card)
    value = Value.new(symbol_card[0])
    color = Color.new(symbol_card[1])
    return Card.new(value, color)
  end


end