require 'byebug'

class Array
  def my_uniq
    ret = []
    self.each do |el|
      ret << el unless ret.include?(el)
    end
    ret
  end

  def two_sum
    array = []
    hash = {}

    self.each_with_index do |el, i|
      if hash.key?(-el)
        array << [hash[-el], i]
      end
      hash[el] = i
    end
    array
  end

  def my_transpose
    arr = Array.new(self.length){Array.new(self.length)}
    self.each_with_index do |el, i|
      (0..el.length - 1).each do |j|
        arr[j][i] = self[i][j]
      end
    end
    arr
  end

  def stock_picker
    ret = nil
    smallest = [self[0], 0]
    biggest = 0

    (1..self.length-1).each_with_index do |i|
      if self[i] < smallest[0]
        smallest = [self[i], i]
      end

      if (self[i] - smallest[0]) > biggest
        biggest = self[i] - smallest[0]
        ret = [smallest[1], i]
      end
    end
      return ret
  end
end

