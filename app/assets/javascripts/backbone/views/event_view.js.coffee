class BeatArea.Views.Event extends Backbone.View
  className: 'row'
  template: JST['event']

  initialize: (options) ->
    console.log "sup"
    @render()

  render: ->
    console.log @model
    @$el.html template
      event: @model

