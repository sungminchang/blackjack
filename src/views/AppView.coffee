class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button>
    <button class="stand-button">Stand</button>
    <button class="replay-button">Play next round</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    <div class="results-container"></div>
  '

  initialize: ->
    @render()
    @$('.hit-button') .on 'click', => @model.get('playerHand').hit()
    @$('.stand-button') .on 'click', => @model.stand()
    @$('.replay-button') .on 'click', => @model.newRound()


    @model.on 'change:end change:stand', (x) =>
      @unbindButtons()
      @$('.results-container').text(x)

    @model.on 'newRound', =>
      @render()
      @rebindButtons()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el


  unbindButtons: ->
    @$('.hit-button') .off 'click'
    @$('.stand-button') .off 'click'

  rebindButtons: ->
    @$('.hit-button') .on 'click', => @model.get('playerHand').hit()
    @$('.stand-button') .on 'click', => @model.stand()
    @$('.replay-button') .on 'click', => @model.newRound()
