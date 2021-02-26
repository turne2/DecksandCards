require './card.rb'

class Deck
    attr_reader :cards
    
    def initialize
        @cards = []
        Card.card_hash.each do |key,value|
            Card.suits.each do |suit|
                @cards.push({value => suit})
            end
        end
    end

    def shuffle
        @cards = @cards.shuffle
    end

    def draw
        @cards.pop
    end

end

print Deck.new.shuffle


