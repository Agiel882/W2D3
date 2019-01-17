class Towers
  attr_accessor :towers

  def initialize
    @towers = [[1,2,3],[],[]]
  end

  def move(start, finish)
    if towers[start].first > towers[finish].last
      raise MoveError
    elsif towers[start].empty?
      raise MoveError
    else
      towers[finish].push(towers[start].shift)
    end
  end
end


class MoveError < StandardError; end