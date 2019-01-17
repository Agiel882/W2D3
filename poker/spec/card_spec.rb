 require "card"

RSpec.describe Card do
  subject(:card){Card.new(:spades, :queen)}

  describe "#initialize" do
    it "sets the card suite" do
     expect(card.suite).to eq(:spades)
    end

    it "sets the card value" do
      expect(card.value).to eq(:queen)
    end
  end

  describe '#to_s' do
    it "returns a string representation" do
      expect(card.to_s).to eq("queen of spades")
    end
  end
end