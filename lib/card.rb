class Card
  include Comparable
  
  SUITS = %w{Spades Hearts Diamonds Clubs}
  attr_accessor :suit, :value, :playable

  # create a single card
  def initialize suit, value
    raise 'Invalid card suit' unless SUITS.include? suit
    raise 'Invalid card value' unless value.to_i >= 0 and value.to_i < 13
    @suit = suit
    @value = value
  end

  def value_name
    card_names = %w[Two Three Four Five Six Seven Eight Nine Ten Jack Queen King Ace]
    return card_names[value]
  end
  
  def <=> other
    return 1 if other.nil?
    return 0 if @value.nil? and other.value.nil?
    return 1 if other.value.nil?
    return -1 if @value.nil?
    @value.to_i <=> other.value.to_i
  end

  def == other
    return false if other.nil?
    return false if (@value.nil? or other.value.nil?) and @value != other.value
    return (@value.to_i == other.value.to_i and @suit == other.suit)
  end

  # creates a standard deck of 52 cards, Ace high
  # the '0' represents 2, and '12' is Ace
  def self.get_deck
    cards = []
    SUITS.each do |suit|
      1..13.times do |i|
        cards.push Card.new(suit, i)
      end
    end
    return cards
  end
end