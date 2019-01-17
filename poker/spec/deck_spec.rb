require "deck"
require "card"
require "byebug"

RSpec.describe Deck do
  let(:card){ double("card", value: "Queen", suite: "Spades")}
  subject(:deck){Deck.new}

  describe "#initialize" do
    it "starts with an empty array of cards" do
      expect(deck.cards).to be_empty
    end
  end

  describe "#populate_deck" do
    before(:each) do 
      deck.populate_deck
    end
    
    it "checks for 52 cards" do
      expect(deck.cards.length).to eq(52)
    end

    it "initializes an array of cards" do
      expect(deck.cards).to all (be_instance_of Card)
    end
  end

  describe "#shuffle" do
    it "calls shuffle on deck" do
      expect(deck.cards).to receive(:shuffle!)
      deck.shuffle
    end
  end

  describe "#draw" do 
    before(:each) { deck.populate_deck }
    it "draws 5 cards" do
      expect(deck.draw(5).length).to eq(5)
    end

    it "returns 5 objects" do
      expect(deck.draw(5)).to all (be_instance_of Card)
    end

    it "returns an empty array if 0 cards are drawn" do 
      expect(deck.draw(0)).to eq([])
    end
  end

  describe "#empty?" do
    it "returns true when there are no cards" do
      expect(deck.empty?).to be true
    end

    it "returns false when there are cards" do
      deck.populate_deck
      expect(deck.empty?).to be false
    end
  end

  describe "#discards" do
    it "returns nil" do
      expect(deck.repopulate([card])).to be_nil
    end

    it "repopulates based upon the discard pile" do
      deck.repopulate([card])
      expect(deck.cards).to include(card)
    end
  end
end