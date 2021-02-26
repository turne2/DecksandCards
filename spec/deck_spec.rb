require './deck'

describe Deck do
  describe '#initialize' do
    it 'creates a deck' do
      expect(Deck.new).to be_a Deck
    end
  end

  describe Card do
    it 'returns an array of 52 cards'do
      deck = Deck.new

      expect(deck.cards).to be_an Array
      expect(deck.cards).to include_a Card
      expect(deck.cards.length).to eq(52)
    end

    it 'contains 13 cards of each suit' do
      deck    = Deck.new
      values  = (1..13).to_a
      suits   = ["clubs", "hearts", "diamonds", "spades"]

      values.each do |value|
        suits.each do |suit|
          expect(
            deck.cards.map{ |card| {value: value, suit: suit} }
          ).to include({ value: value, suit: suit })
        end
      end
    end
  end

  describe Shuffle do
    it 'rearranges the order of cards in a deck' do
      deck = Deck.new
      original_cards = deck.cards.dup
      deck.shuffle

      expect(deck.cards).to_not eq(original_cards)
    end
    it 'returns an array of shuffled cards' do
      deck = Deck.new
      shuffled = deck.shuffle

      expect(shuffled).to be_an Array
      expect(shuffled).to include_a Card
      expect(shuffled.length).to eq(52)
    end
  end

  describe Draw do
    it 'returns a card from the deck' do
      expect(Deck.new.draw).to be_a Card
    end

    it 'removes the card from the deck' do
      deck = Deck.new
      deck.draw
      expect(deck.cards.length).to eq 51
    end
  end
end
