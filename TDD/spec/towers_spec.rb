require "towers"

RSpec.describe Towers do
  subject(:towers){Towers.new}
  describe "#initialize" do
    it "sets the initial tower state" do
      expect(towers.towers).to eq([[1,2,3],[],[]])
    end
  end

  describe "#move" do
    it "moves a disc from the starting array to the next array" do
      towers.move(1, 2)
      expect(towers).to eq([[2, 3],[1],[]]) 
    end

    it "does not move a larger disc onto a smaller disc" do
      towers.move(1, 2)
      expect{towers.move(0, 1)}.to raise(MoveError)
    end

    it "raises an error if the starting space is empty" do
      expect{towers.move(3,0)}.to raise(MoveError)
    end
  end

  describe "#won?" do 
    it "returns true if the game is won" do
      towers.towers=[[],[],[1,2,3]]
      expect(towers.won?).to be_true
    end

    it "returns false if the game is not won" do
      expect(towers.won?).to be_false
    end
  end

end