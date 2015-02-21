class window.CardView extends Backbone.View
  className: 'card'

  # tag name 'img'
  # template <%=  %>

  # template: _.template '<%= rankName %> of <%= suitName %>'
  template: _.template '<img src="./img/cards/<%=fileString%> " >'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    strObject =
      fileString: (@model.get 'rankName') + '-' + (@model.get 'suitName') + '.png'


    @$el.addClass 'covered' unless @model.get 'revealed'

    strObject.fileString = 'card-back.png' if !@model.get 'revealed'

    @$el.html @template strObject

    # if exposed show img
    # otherwise show card back
