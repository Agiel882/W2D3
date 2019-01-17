class Card
  attr_reader :suite, :value
  def initialize(suite, value)
    @suite = suite
    @value = value
  end

  def to_s
    "#{value.to_s} of #{suite.to_s}"
  end
end
