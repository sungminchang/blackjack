assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null
  specialHand1 = null
  blackjackHand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()
    card1 =
      rank: 5 #0-12 as ranks
      suit: 0 #0-3 as suits    specialHand1 = new Hand [new Card(43), new Card(22)]
    card2 =
      rank: 12 #0-12 as ranks
      suit: 2 #0-3 as suits    specialHand1 = new Hand [new Card(43), new Card(22)]
    Ace =
      rank: 1 #0-12 as ranks
      suit: 0 #0-3 as suits    specialHand1 = new Hand [new Card(43), new Card(22)]
    King =
      rank: 0 #0-12 as ranks
      suit: 2 #0-3 as suits    specialHand1 = new Hand [new Card(43), new Card(22)]
    specialHand1 = new Hand([new Card(card1), new Card(card2)])
    blackjackHand = new Hand([new Card(Ace), new Card (King)])

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49

  describe 'hand composition', ->
    it 'should add up to a certain score', ->
      assert.strictEqual specialHand1.scores(), 15
    it 'cards should have a certain rank and suit', ->
      assert.strictEqual specialHand1.first().get('rankName'), 5
      assert.strictEqual specialHand1.first().get('suitName'), 'Spades'
      assert.strictEqual specialHand1.last().get('rankName'), 'Queen'
      assert.strictEqual specialHand1.last().get('suitName'), 'Clubs'

  describe 'Blackjack', ->
    it 'should recognize Blackjack (one Ace, one card of value 10)', ->
      assert.strictEqual blackjackHand.first().get('rankName'), 'Ace'
      assert.strictEqual blackjackHand.first().get('suitName'), 'Spades'
      assert.strictEqual blackjackHand.last().get('rankName'), 'King'
      assert.strictEqual blackjackHand.last().get('suitName'), 'Clubs'
      assert.strictEqual blackjackHand.last().get('value') +
                         blackjackHand.first().get('value'), 21


