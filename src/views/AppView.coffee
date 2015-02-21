class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  # events:
  #   'click .hit-button': -> @model.get('playerHand').hit()
  #   'click .stand-button': -> @model.get('playerHand').stand()

    # 'click .stand-button': -> @model.hit()
    # 'click .stand-button': -> @model.stand()

    #events shouldn't be propagating to the Player hand
    #not an associated model

  initialize: ->
    @render()
    console.log(@model)
    @$('.hit-button') .on 'click', => @model.get('playerHand').hit()
    @$('.stand-button') .on 'click', => @model.get('playerHand').stand()
    @model.on 'change:end', =>
      @$('.hit-button') .off 'click'
      @$('.stand-button') .off 'click'



  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

