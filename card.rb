require './deck.rb'

class Card
    attr_reader :value, :suit

   @@card_hash = {

        13 => "King",
        12 => "Queen",
        11 => "Jack",
        10 => "10",
        9 => "9",
        8 => "8",
        7 => "7",
        6 => "6",
        5 => "5",
        4 => "4",
        3 => "3",
        2 => "2",
        1 => "Ace"      
   }

   @@suits = ['spades','diamonds','clubs','hearts']

   def initialize(value,suit)
       @value = value
       @suit = suit
   end

   def value 
       @value
   end

   def suit
       @suit
   end

   def face
       @@card_hash[@value]
   end

   def self.card_hash
       @@card_hash
   end

   def self.suits
       @@suits
   end
end