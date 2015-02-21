class window.Deck extends Backbone.Collection
  model: Card

  initialize: ->
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13 #0-12 as ranks
        suit: Math.floor(card / 13) #0-3 as suits

      new Card({rank: 13...,
                suit: 13....})


  dealPlayer: -> new Hand [@pop(), @pop()], @
  # check for player bust, listen for stand and hit events

  dealDealer: -> new Hand [@pop().flip(), @pop()], @, true
  #play automatically


