# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get 'playerHand'
    .on "change:bust", ->
      console.log('hi')

    #@play()
    #@playPlayer()
    #@playDealer()
    #@assignWinner()



  stand: ->
    @playDealer()


  play: ->
    # play players hand
    # play dealer's hand
    # compare hands and assign winner
    #

  playPlayer: ->
  # listen for hit, stand, check for bust

  playDealer: ->
  # play automatically

  assignWinner: ->
