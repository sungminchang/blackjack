

assert = chai.assert

describe 'Blackjack Table', ->
  deck = null

  describe 'Persisting deck', ->
    it 'should use the same deck across multiple rounds', ->
      # Play a round
      # Start a new round
      #
      assert.strictEqual deck, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49
