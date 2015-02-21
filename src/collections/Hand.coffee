class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    @bust = false  #   JS this.bust = false;

  hit: ->
    console.log(@minScore())
    @add(@deck.pop())
    console.log(@minScore())
    @scores()
    console.log(@bust)

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.

    # [@minScore(), @minScore() + 10 * @hasAce()]

    if @minScore() > 21
      @bust = true
      debugger
      return [@minScore()]

    if !@hasAce()
        return [@minScore()]
    else if @minScore() + 10 <= 21
      return [@minScore() + 10]
    else return [@minScore()]








