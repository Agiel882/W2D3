require "tdd"

RSpec.describe Array do
  # subject(:array) {}

  describe "#my_uniq" do
    it "returns an array without duplicates" do
      expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
    end

    it "returns an array of strings without duplicates" do
      expect(["A", "B", "B", "A", "D"].my_uniq).to eq(["A", "B", "D"]) 
    end
  end 

  describe "#two_sum" do
    it "finds a pair" do 
      expect([1,2,-1,4,3].two_sum).to eq([[0,2]])
    end

    it "returns multiple pairs in order" do
      expect([1,2,-1,4,3, -3].two_sum).to eq([[0,2],[4,5]])
    end
    
    it "returns an empty array if no pair is found" do
      expect([1,2,3].two_sum).to be_empty
    end

    it "doesn't find extraneous zeroes" do
      expect([1,2,-1,4,3,0].two_sum).to eq([[0,2]])
    end

    it "does find zero pairs" do
      expect([1,2,0,-1,4,3,0].two_sum).to eq([[0,3],[2,6]])
    end
  end 

  describe "#transpose" do

    it "transposes a 3x3 grid" do
      rows = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
        ]
      soln = [[0, 3, 6],
              [1, 4, 7],
              [2, 5, 8]]
      expect(rows.my_transpose).to eq(soln)
    end

    it "includes nil when applicable" do
      rows = [
        [0, 1, nil],
        [3, nil, 5],
        [nil, 7, 8]
        ]
      soln = [[0, 3, nil],
              [1, nil, 7],
              [nil, 5, 8]]
      expect(rows.my_transpose).to eq(soln)
    end

    it "returns an empty array if sent an empty array" do
      expect([].my_transpose).to be_empty
    end
  end

  describe "#stock_picker" do
    it "returns the most profitable pair" do
      expect([0,1,9,2].stock_picker).to eq([0,2])
    end

    it "doesn't time travel" do
      expect([9,2,7,0].stock_picker).to eq([1,2])
    end

    it "returns nil if no profit" do
      expect([8,5,3,1].stock_picker).to be_nil
    end 
  end

end

