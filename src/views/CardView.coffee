class window.CardView extends Backbone.View
  className: 'card'

  # tag name 'img'
  # template <%=  %>

  template: _.template '<%= rankName %> of <%= suitName %>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'

    # add the imgs

    # if exposed show img
    # otherwise show card back
