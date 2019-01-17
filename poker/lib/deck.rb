require_relative "card"
require "byebug"

class Deck
  attr_reader :cards

  SUITES = [
    :hearts, 
    :spades,
    :diamonds,
    :clubs
    ].freeze  

  VALUES = [
    :ace,
    :two,
    :three,
    :four,
    :five,
    :six,
    :seven,
    :eight,
    :nine,
    :ten,
    :jack,
    :queen,
    :king,
    ].freeze

  def initialize
    @cards = []
  end


  def populate_deck
    SUITES.each do |suite|
      VALUES.each do |value|
        card = Card.new(suite, value)
        cards << card 
      end
    end
    shuffle
  end

  def repopulate(discards)
    @cards += discards if empty?
    nil
  end

  def shuffle
    cards.shuffle!
    nil
  end

  def draw(num_cards)
    raise DeckError if cards.length < num_cards
    ret = []
    num_cards.times { ret << cards.pop }
    ret
  end

  def empty?
    cards.empty?
  end
end

class DeckError < ArgumentError; end