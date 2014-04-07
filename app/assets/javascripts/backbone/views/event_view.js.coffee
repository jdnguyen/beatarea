class BeatArea.Views.Event extends Backbone.View
  className: 'row'
  template: JST['event']
  tagName: 'article'

  initialize: (options) ->
    @render()

  render: ->
    @$el.html @template
      event: @model

