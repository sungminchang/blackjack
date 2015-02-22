class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    @bust = false  #   JS this.bust = false;
    return

  hit: ->
    cardToAdd = @deck.pop()
    @add(cardToAdd)
    @scores()
    if @bust
      @trigger('change:bust')
    cardToAdd

  busted: ->
    @bust

  autoPlay: ->
    console.log(@scores())

    if @isDealer then @first().flip()

    @hit() while @scores() < 17

  # stand: ->
  #   @trigger('change:stand')

  hasAce: -> @reduce (memo, card) ->
    memo or (card.get 'revealed') and card.get('value') is 1
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
      return @minScore()

    if !@hasAce()
      return @minScore()
    else if @minScore() + 10 <= 21
      return @minScore() + 10
    else return @minScore()








