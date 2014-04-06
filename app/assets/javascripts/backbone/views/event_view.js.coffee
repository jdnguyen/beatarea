class BeatArea.Views.Event extends Backbone.View
  className: 'row'
  template: JST['event']

  initialize: (options) ->
    @render()

  render: ->
    @$el.html @template
      event: @model

