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
    @trigger('change:stand')
    @dealerTurn()

  dealerTurn: ->
    (@get 'dealerHand').autoPlay()
    @assignWinner()

  assignWinner: ->
    messageString = ""
    if (@get 'playerHand').busted() then messageString = "You bust! Dealer Wins"
    else if (@get 'dealerHand').busted() then messageString = "Dealer busts. You win!"
    else if (@get 'playerHand').scores() > (@get 'dealerHand').scores() then messageString = "You win!"
    else if (@get 'playerHand').scores() < (@get 'dealerHand').scores() then messageString = "Dealer wins!"
    else messageString = "Push. Dealer and player have the same score."

    @trigger('change:end', messageString)



