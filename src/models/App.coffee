# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    (@get 'playerHand').on "change:bust", => @assignWinner()
    (@get 'playerHand').on "change:stand", => @dealerTurn()

  stand: ->
    console.log('koz')
    @trigger('change:stand', 'koz')
    @dealerTurn()

  dealerTurn: ->
    (@get 'dealerHand').autoPlay()
    console.log('dealer turn')

  assignWinner: ->
    @trigger('change:end')



