require './deck'

describe Card do
  describe '#initialize' do
    context "when no arguments are present" do
      it "raises an error" do
        expect { Card.new }.to raise_error ArgumentError
      end
    end
    context "when the first argument is an integer from 1-13 and the second argument is a valid card suit" do
      it 'returns an instance of the Card class' do
        card = Card.new(7, 'spades')
        expect(card).to be_a Card
      end
    end

    # Bonus, remove the 'x' in front of 'context' to activate
    xcontext "when the first argument is greater than 13" do
      it 'raises an error' do
        expect { Card.new(15, 'hearts') }.to raise_error ArgumentError
      end
    end
    xcontext "when the first argument is lower than 1" do
      it 'raises an error' do
        expect { Card.new(0, 'hearts') }.to raise_error ArgumentError
      end
    end
    xcontext "when the first argument is not an integer" do
      it 'raises an error' do
        expect { Card.new("not a number", 'hearts') }.to raise_error ArgumentError
      end
    end
    xcontext "when the second argument is not a valid card suit" do
      it 'raises an error' do
        expect { Card.new(12, 'not a real suit') }.to raise_error ArgumentError
      end
    end
  end

  describe '#value' do
    it 'returns an integer' do
      expect(Card.new(13, "hearts").value).to be_a Integer
    end

    it 'can only be read from, not written to' do
      card = Card.new(13, "hearts")
      expect { card.value = 3  }.to raise_error NoMethodError
    end
  end

  describe '#suit' do
    it 'returns a string' do
      expect(Card.new(13, "hearts").suit).to be_a String
    end

    it 'can only be read from, not written to' do
      card = Card.new(13, "hearts")
      expect { card.suit = 3  }.to raise_error NoMethodError
    end
  end

  describe '#face' do
    context "when the value is a number from 2-10" do
      it 'returns a string describing the face of the card' do
        card = Card.new(3, 'hearts')
        expect(card.face).to eq('3')
      end
    end
    context "when the value is a face card" do
      it 'returns the name of the face card' do
        card = Card.new(13, 'hearts')
        expect(card.face).to eq('King')
      end
    end
    context "when the value is 1" do
      it 'returns the string "Ace"' do
        card = Card.new(1, 'hearts')
        expect(card.face).to eq('Ace')
      end
    end
  end
end
